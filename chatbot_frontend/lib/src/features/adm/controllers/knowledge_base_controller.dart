import 'package:flutter/material.dart';
import '../models/knowledge_base_model.dart';
import '../services/knowledge_base_service.dart';
import '../models/knowledge_base_model_dto.dart';

class KnowledgeBaseController extends ChangeNotifier {
  final service = KnowledgeBaseService();

  List<KnowledgeBase> items = [];
  bool loading = false;

  Future<void> fetch() async {
    try {
      loading = true;
      notifyListeners();

      items = await service.load();
    } finally {
      loading = false;
      notifyListeners();
    }
  }

  Future<void> create(CreateKnowledgeBaseDto dto) async {
    await service.create(dto);
    await fetch();
  }

  Future<void> update(int id, CreateKnowledgeBaseDto dto) async {
    await service.update(id, dto);
    await fetch();
  }

  Future<void> delete(int id) async {
    await service.delete(id);
    await fetch();
  }
}
