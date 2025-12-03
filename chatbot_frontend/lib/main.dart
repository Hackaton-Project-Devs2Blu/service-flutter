import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/features/chatbot/controllers/chat_controller.dart';
import 'src/features/chatbot/views/chat_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ChatController())],
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
      home:
          const ChatPage(), //redirencionando direatamente para a pagina do chat
    );
  }
}
