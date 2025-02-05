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
  // Lê a entrada do usuário no terminal
  print('Digite o número de bytes para conversão:');
  String? input = stdin.readLineSync(); // Lê a linha de entrada como string

  if (input != null && int.tryParse(input) != null) {
    int bytes = int.parse(input); // Converte a entrada para inteiro
    await convertBytes(bytes); // Chama a função para conversão
  } else {
    print('Entrada inválida. Por favor, insira um número inteiro válido.');
  }
}
