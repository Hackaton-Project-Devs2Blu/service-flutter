import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/knowledge_base_controller.dart';
import '../widgets/knowledge_card.dart';
import '../widgets/knowledge_form.dart';

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
        title: const Text("CapivarIA - Admin"),
        backgroundColor: Colors.green,
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
