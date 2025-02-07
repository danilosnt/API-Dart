import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

Future<void> convertBytes(int bytes) async {
  final url = Uri.parse('http://localhost:8080?bytes=$bytes');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    print('Conversion of $bytes bytes:');
    print('KB: ${data["KB"].toStringAsFixed(2)}');
    print('MB: ${data["MB"].toStringAsFixed(2)}');
    print('GB: ${data["GB"].toStringAsFixed(2)}');
    print('TB: ${data["TB"].toStringAsFixed(2)}');
  } else {
    print('Error converting bytes: ${response.body}');
  }
}

void main() async {
  while (true) {
    
    print('\nEnter the number of bytes to convert:');
    String? input = stdin.readLineSync();

    if (input != null && int.tryParse(input) != null) {
      int bytes = int.parse(input);
      await convertBytes(bytes);
    } else {
      print('Invalid input. Please enter a valid integer.');
      continue;
    }

    print('\nDo you want to convert another value? \n Type "yes" to continue or any other key to exit.');
    String? response = stdin.readLineSync()?.trim().toLowerCase();

    if (response != 'yes') {
      print('Exiting the program...');
      break;
    }
  }
}
