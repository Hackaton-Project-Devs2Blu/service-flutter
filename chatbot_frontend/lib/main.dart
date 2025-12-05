import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/features/chatbot/controllers/chat_controller.dart';
import 'src/features/chatbot/repositories/chat_repository.dart';
import 'src/features/chatbot/repositories/chat_repository_impl.dart';
import 'src/features/chatbot/services/ai_service.dart';
<<<<<<< HEAD
<<<<<<< HEAD
import 'src/features/chatbot/controllers/chat_controller.dart';
import 'src/features/adm/views/adm_page.dart';
import 'src/features/adm/controllers/knowledge_base_controller.dart';
import 'src/features/adm/repositories/knowledge_base_repository.dart';
import 'src/features/adm/services/knowledge_base_service.dart';
=======
>>>>>>> 608886c (feat: auth-tela-estilizada)
=======
>>>>>>> 5b24707 (fix: tela-login-corrigida)
import 'src/features/auth/views/login_page.dart';
import 'src/features/auth/views/register_peage.dart';
=======
import 'src/features/chatbot/controllers/chat_controller.dart';
import 'src/features/adm/views/adm_page.dart';
import 'src/features/adm/controllers/knowledge_base_controller.dart';
import 'src/features/adm/repositories/knowledge_base_repository.dart';
import 'src/features/adm/services/knowledge_base_service.dart';
>>>>>>> 52b5033 (feat: adm-page-)

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

        Provider(create: (_) => KnowledgeBaseService()),
        Provider(create: (context) => KnowledgeBaseRepository()),
        ChangeNotifierProvider(create: (_) => KnowledgeBaseController()),
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
<<<<<<< HEAD
      title: 'Patricia',
      initialRoute: '/adm',
      routes: {
        //  '/': (context) => const LoginPage(), //ajustar
        '/adm': (context) => const KBListPage(),
        'chat': (context) => const ChatPage(),
      },
=======
      title: 'CapivarIA',
<<<<<<< HEAD
      home: const TelaLogin(), //provisório
=======
      home: const KBListPage(), //provisório
>>>>>>> 52b5033 (feat: adm-page-)
>>>>>>> 5b24707 (fix: tela-login-corrigida)
    );
  }
}
