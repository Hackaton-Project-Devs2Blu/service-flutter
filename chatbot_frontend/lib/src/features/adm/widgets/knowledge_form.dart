import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/knowledge_base_controller.dart';
import '../models/knowledge_base_model.dart';

class KBForm extends StatefulWidget {
  final KnowledgeBase? kb;

  const KBForm({super.key, this.kb});

  @override
  State<KBForm> createState() => _KBFormState();
}

class _KBFormState extends State<KBForm> {
  final titulo = TextEditingController();
  final categoria = TextEditingController();
  final conteudo = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.kb != null) {
      titulo.text = widget.kb!.titulo;
      categoria.text = widget.kb!.categoria;
      conteudo.text = widget.kb!.conteudo;
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.read<KnowledgeBaseController>();

    return AlertDialog(
      title: Text(widget.kb == null ? "Adicionar" : "Editar"),
      content: SizedBox(
        width: 400,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titulo,
              decoration: const InputDecoration(labelText: "Título"),
            ),
            TextField(
              controller: categoria,
              decoration: const InputDecoration(labelText: "Categoria"),
            ),
            TextField(
              controller: conteudo,
              decoration: const InputDecoration(labelText: "Conteúdo"),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: const Text("Cancelar"),
          onPressed: () => Navigator.pop(context),
        ),
        ElevatedButton(
          child: const Text("Salvar"),
          onPressed: () {
            final body = {
              "titulo": titulo.text,
              "categoria": categoria.text,
              "conteudo": conteudo.text,
              "atualizado_por": 1, // ID do admin logado
            };

            if (widget.kb == null) {
              controller.create(body);
            } else {
              controller.update(widget.kb!.id, body);
            }

            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
