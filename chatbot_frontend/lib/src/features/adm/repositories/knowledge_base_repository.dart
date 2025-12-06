import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/knowledge_base_model.dart';
import '../models/knowledge_base_model_dto.dart';

class KnowledgeBaseRepository {
  final String baseUrl =
      "http://hackathon-project-alb-hackathon-1539304958.us-west-2.elb.amazonaws.com/api/java/knowledgebase";

  Future<List<KnowledgeBase>> getAll() async {
    final res = await http.get(Uri.parse(baseUrl));

    if (res.statusCode != 200) {
      throw Exception("Erro: ${res.statusCode} - ${res.body}");
    }

    final Map<String, dynamic> decoded = jsonDecode(res.body);
    final List<dynamic> data = decoded['content'] ?? [];

    return data
        .map((e) => KnowledgeBase.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<void> create(CreateKnowledgeBaseDto dto) async {
    final res = await http.post(
      Uri.parse(baseUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(dto.toJson()),
    );

    if (res.statusCode != 200 && res.statusCode != 201) {
      throw Exception("Erro ao criar: ${res.statusCode} - ${res.body}");
    }
  }

  Future<void> update(int id, CreateKnowledgeBaseDto dto) async {
    final res = await http.put(
      Uri.parse("$baseUrl/$id"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(dto.toJson()),
    );

    if (res.statusCode != 200) {
      throw Exception("Erro ao atualizar: ${res.statusCode} - ${res.body}");
    }
  }

  Future<void> delete(int id) async {
    final res = await http.delete(Uri.parse("$baseUrl/$id"));

    if (res.statusCode != 200 && res.statusCode != 204) {
      throw Exception("Erro ao deletar: ${res.statusCode} - ${res.body}");
    }
  }
}
