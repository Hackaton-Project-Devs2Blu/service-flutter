import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/knowledge_base_model.dart';

class KnowledgeBaseRepository {
  final String baseUrl =
      "http://hackathon-project-alb-hackathon-1539304958.us-west-2.elb.amazonaws.com/api/java"; //ADD PORTA

  Future<List<KnowledgeBase>> getAll() async {
    try {
      final res = await http.get(Uri.parse("$baseUrl/knowledgebase"));

      if (res.statusCode != 200) {
        throw Exception("Erro: ${res.statusCode} - ${res.body}");
      }

      final Map<String, dynamic> decoded = jsonDecode(res.body);
      final List<dynamic> data = decoded['content'] ?? [];

      return data
          .map((e) => KnowledgeBase.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print("Erro ao buscar dados: $e");
      rethrow;
    }
  }

  Future<void> create(Map<String, dynamic> body) async {
    await http.post(
      Uri.parse(baseUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );
  }

  Future<void> update(int id, Map<String, dynamic> body) async {
    await http.put(
      Uri.parse("$baseUrl/$id"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );
  }

  Future<void> delete(int id) async {
    await http.delete(Uri.parse("$baseUrl/$id"));
  }
}
