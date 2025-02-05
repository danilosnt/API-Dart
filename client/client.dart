import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> convertBytes(int bytes) async {
  final url = Uri.parse('http://localhost:8080?bytes=$bytes');
  final response = await http.get(url);

 if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    print('Bytes: $bytes');
    print('KB: ${data['KB']}');
    print('MB: ${data['MB']}');
    print('GB: ${data['GB']}');
    print('TB: ${data['TB']}');
  } else {
    print('Erro: ${response.body}');
  } 
}

void main() async {
  await convertBytes(1024);
  await convertBytes(1048576);
  await convertBytes(1073741824);
  await convertBytes(1099511627776);
}