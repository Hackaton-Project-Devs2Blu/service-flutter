import '../models/knowledge_base_model.dart';
import '../repositories/knowledge_base_repository.dart';

class KnowledgeBaseService {
  final repo = KnowledgeBaseRepository();

  Future<List<KnowledgeBase>> load() async {
    try {
      return await repo.getAll();
    } catch (e) {
      throw Exception("Erro ao carregar dados: $e");
    }
  }

  Future<void> create(Map<String, dynamic> body) => repo.create(body);

  Future<void> update(int id, Map<String, dynamic> body) =>
      repo.update(id, body);

  Future<void> delete(int id) => repo.delete(id);
}
