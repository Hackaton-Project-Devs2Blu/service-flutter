import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/knowledge_base_model.dart';

class KnowledgeBaseRepository {
  final String baseUrl = ""; //ADD PORTA

  Future<List<KnowledgeBase>> getAll() async {
    final res = await http.get(Uri.parse("$baseUrl/knowledgebase"));

    final List data = jsonDecode(res.body);
    return data.map((e) => KnowledgeBase.fromJson(e)).toList();
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
