import 'dart:convert';
import 'dart:io'; // Importa a biblioteca para ler entradas do terminal
import 'package:http/http.dart' as http;

Future<void> convertBytes(int bytes) async {
  final url = Uri.parse('http://localhost:8080?bytes=$bytes');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    print('Conversão de $bytes bytes:');
    print('KB: ${data["KB"].toStringAsFixed(2)}');
    print('MB: ${data["MB"].toStringAsFixed(2)}');
    print('GB: ${data["GB"].toStringAsFixed(2)}');
    print('TB: ${data["TB"].toStringAsFixed(2)}');
  } else {
    print('Erro ao converter bytes: ${response.body}');
  }
}

void main() async {
  while (true) {
    // Lê a entrada do usuário no terminal
    print('\nDigite o número de bytes para conversão:');
    String? input = stdin.readLineSync();

    if (input != null && int.tryParse(input) != null) {
      int bytes = int.parse(input);
      await convertBytes(bytes);
    } else {
      print('Entrada inválida. Por favor, insira um número inteiro válido.');
      continue; // Retorna ao início do loop
    }

    // Pergunta ao usuário se deseja converter outro valor
    print('\nDeseja converter outro valor? (s/n)');
    String? resposta = stdin.readLineSync()?.trim().toLowerCase();

    if (resposta != 's') {
      print('Encerrando o programa...');
      break;
    }
  }
}
