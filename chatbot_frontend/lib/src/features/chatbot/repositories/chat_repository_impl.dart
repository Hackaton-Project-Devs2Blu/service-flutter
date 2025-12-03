import '../services/ai_service.dart';
import 'chat_repository.dart';

class ChatRepositoryImpl implements ChatRepository {
  final AIService _aiService;
  ChatRepositoryImpl({required AIService aiService}) : _aiService = aiService;

  @override
  Future<String> sendMessage(String message) {
    return _aiService.sendMessage(message);
  }
}
