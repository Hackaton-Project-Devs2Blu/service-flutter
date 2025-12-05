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
      backgroundColor: Color(0xFFFFFFFF),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Color(0xfff597B3E)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/imagens/capivaria.jpeg',
                      width: 56,
                      height: 56,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Patricia',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Sair'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: const Color(0xfff597B3E),

        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),

        title: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white24,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/imagens/capivaria.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 12),
            const Text(
              "Patricia",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: FloatingActionButton.extended(
          backgroundColor: Color(0xfff597B3E),

          icon: Icon(Icons.add, color: Colors.white),

          label: Text(
            "Novo",
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),

          onPressed: () =>
              showDialog(context: context, builder: (_) => const KBForm()),
        ),
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
