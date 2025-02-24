## Byte converter with Dart using API

<h3>How to run this code on your machine</h3>

1 - Clone this repository.

2 - In the terminal, run the ```dart api/server.dart```. A message will appear saying that the server is running on localhost.

3 - After, in the terminal, run the ```dart client/client.dart```

4 - Follow the instructions in the code.

<h3>Structure</h3>

```api/server.dart```: The main script that initializes the server.
- Prompts the user to enter a number of bytes.
- Sends an HTTP request to the server for conversion.
- Displays the converted values in the terminal.

```client/client.dart```: Script that makes requests to the server and processes responses.
- Listens for HTTP requests on port 8080.
- Processes byte conversions to KB, MB, GB, and TB.
- Returns the converted values in JSON format.

Note: You need to install the Dart extensions in your VS Code.
