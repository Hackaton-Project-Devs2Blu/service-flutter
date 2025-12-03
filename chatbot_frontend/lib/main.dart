import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/features/chatbot/controllers/chat_controller.dart';
import 'src/features/chatbot/views/chat_page.dart';
import 'src/features/chatbot/repositories/chat_repository.dart';
import 'src/features/chatbot/repositories/chat_repository_impl.dart';
import 'src/features/chatbot/services/ai_service.dart';
import 'src/features/chatbot/controllers/chat_controller.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (_) => AIService()),
        ProxyProvider<AIService, ChatRepository>(
          update: (_, aiService, __) =>
              ChatRepositoryImpl(aiService: aiService),
        ),
        ChangeNotifierProxyProvider<ChatRepository, ChatController>(
          create: (context) =>
              ChatController(repository: context.read<ChatRepository>()),
          update: (_, repository, __) => ChatController(repository: repository),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CapivarIA',
      home: const ChatPage(), //provisório
    );
  }
}
