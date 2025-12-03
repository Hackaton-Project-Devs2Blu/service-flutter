import 'package:flutter/material.dart';
import '../models/knowledge_base_model.dart';
import '../services/knowledge_base_service.dart';

class KnowledgeBaseController extends ChangeNotifier {
  final service = KnowledgeBaseService();

  List<KnowledgeBase> items = [];
  bool loading = false;

  Future<void> fetch() async {
    loading = true;
    notifyListeners();

    items = await service.load();

    loading = false;
    notifyListeners();
  }

  Future<void> create(Map<String, dynamic> body) async {
    await service.create(body);
    await fetch();
  }

  Future<void> update(int id, Map<String, dynamic> body) async {
    await service.update(id, body);
    await fetch();
  }

  Future<void> delete(int id) async {
    await service.delete(id);
    await fetch();
  }
}
