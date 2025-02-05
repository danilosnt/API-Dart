import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

Future<Response> convertBytes(Request request) async {
  try {
    final queryParams = request.url.queryParameters;
    if (!queryParams.containsKey('bytes')) {
      return Response.badRequest(body: jsonEncode({'error': 'Parâmetro "bytes" é obrigatório'}));
    }

    final int bytes = int.parse(queryParams['bytes']!);

    final conversion = {
      'KB': bytes / 1024,
      'MB': bytes / (1024 * 1024),
      'GB': bytes / (1024 * 1024 * 1024),
      'TB': bytes / (1024 * 1024 * 1024 * 1024),
    };

    return Response.ok(jsonEncode(conversion), headers: {'Content-Type': 'application/json'});
  } catch (e) {
    return Response.internalServerError(body: jsonEncode({'error': e.toString()}));
  }
}

void main() async {
  final handler = const Pipeline().addMiddleware(logRequests()).addHandler(convertBytes);

  final server = await shelf_io.serve(handler, 'localhost', 8080);
  print('Servidor rodando em http://${server.address.host}:${server.port}');
}
