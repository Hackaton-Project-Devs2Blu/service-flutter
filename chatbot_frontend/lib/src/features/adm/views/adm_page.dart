import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/knowledge_base_controller.dart';
import '../widgets/knowledge_card.dart';
import '../widgets/knowledge_form.dart';
import '../../chatbot/views/chat_page.dart';

class KBListPage extends StatefulWidget {
  const KBListPage({super.key});

  @override
  State<KBListPage> createState() => _KBListPageState();
}

class _KBListPageState extends State<KBListPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<KnowledgeBaseController>().fetch();
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<KnowledgeBaseController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff597B3E),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white24, //ajustar cor
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/imagens/capivaria.jpeg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        title: const Text(
          "CapivarIA - Admin",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.chat),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ChatPage()),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: const Text("Add"),
        onPressed: () =>
            showDialog(context: context, builder: (_) => const KBForm()),
      ),
      body: controller.loading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: controller.items.length,
              itemBuilder: (_, i) {
                final kb = controller.items[i];
                return KBCard(
                  kb: kb,
                  onEdit: () => showDialog(
                    context: context,
                    builder: (_) => KBForm(kb: kb),
                  ),
                  onDelete: () => controller.delete(kb.id),
                );
              },
            ),
    );
  }
}
