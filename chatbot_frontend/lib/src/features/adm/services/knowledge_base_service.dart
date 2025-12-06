import '../models/knowledge_base_model.dart';
import '../repositories/knowledge_base_repository.dart';
import '../models/knowledge_base_model_dto.dart';

class KnowledgeBaseService {
  final repo = KnowledgeBaseRepository();

  Future<List<KnowledgeBase>> load() => repo.getAll();

  Future<void> create(CreateKnowledgeBaseDto dto) => repo.create(dto);

  Future<void> update(int id, CreateKnowledgeBaseDto dto) =>
      repo.update(id, dto);

  Future<void> delete(int id) => repo.delete(id);
}
