import 'package:flutter/material.dart';
import '../models/message_model.dart';
import '../services/ai_service.dart';
import '../repositories/chat_repository.dart';

class ChatController extends ChangeNotifier {
  final ChatRepository _repository;
  ChatController({required ChatRepository repository})
    : _repository = repository;
  final AIService _aiService = AIService();
  final List<MessageModel> messages = [];
  bool loading = false;

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    messages.add(MessageModel(text: text, isUser: true));
    loading = true;
    notifyListeners();

    final response = await _aiService.sendMessage(text);

    messages.add(MessageModel(text: response, isUser: false));
    loading = false;
    notifyListeners();
  }
}
