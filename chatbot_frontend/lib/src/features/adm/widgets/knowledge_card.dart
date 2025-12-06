import 'package:flutter/material.dart';
import '../models/knowledge_base_model.dart';
import 'package:intl/intl.dart';

class KBCard extends StatelessWidget {
  final KnowledgeBase kb;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const KBCard({
    super.key,
    required this.kb,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final dateFormatted = DateFormat(
      'dd/MM/yyyy HH:mm',
    ).format(kb.atualizadoEm);

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _row("Título", kb.titulo),
            _row("Categoria", kb.categoria),
            _row("Pergunta", kb.pergunta),
            _row("Resposta", kb.resposta),
            _row("Atualizado por", kb.atualizadoPor),
            _row("Data", dateFormatted),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.green),
                  onPressed: onEdit,
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: onDelete,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _row(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text("$label: ", style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
