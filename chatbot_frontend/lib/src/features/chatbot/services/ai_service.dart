import 'dart:convert';
import 'package:http/http.dart' as http;

class AIService {
  final String baseUrl = "http://localhost:5015/api/csharp/chat"; // CHAVE API

  Future<String> sendMessage(String message) async {
    final url = Uri.parse(baseUrl);

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"message": message}),
    );

    if (response.statusCode != 200) {
      throw Exception("Erro da API: ${response.body}");
    }

    final json = jsonDecode(response.body);

    return json["reply"] ?? "Resposrta vazia da API";
  }
}
