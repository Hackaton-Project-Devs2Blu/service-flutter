import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/knowledge_base_controller.dart';
import '../models/knowledge_base_model.dart';
import '../models/knowledge_base_model_dto.dart';

class KBForm extends StatefulWidget {
  final KnowledgeBase? kb;

  const KBForm({super.key, this.kb});

  @override
  State<KBForm> createState() => _KBFormState();
}

class _KBFormState extends State<KBForm> {
  final titulo = TextEditingController();
  final categoria = TextEditingController();
  final pergunta = TextEditingController();
  final resposta = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.kb != null) {
      titulo.text = widget.kb!.titulo;
      categoria.text = widget.kb!.categoria;
      pergunta.text = widget.kb!.pergunta;
      resposta.text = widget.kb!.resposta;
    }
  }

  @override
  Widget build(BuildContext context) {
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
              controller: pergunta,
              decoration: const InputDecoration(labelText: "Pergunta"),
            ),
            TextField(
              controller: resposta,
              decoration: const InputDecoration(labelText: "Resposta"),
              maxLines: 3,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: const Text("Cancelar"),
          onPressed: () => Navigator.pop(context),
        ),

        // 🔥 BOTÃO CORRIGIDO
        ElevatedButton(
          child: const Text("Salvar"),
          onPressed: () async {
            final controller = context.read<KnowledgeBaseController>();

            final dto = CreateKnowledgeBaseDto(
              titulo: titulo.text,
              categoria: categoria.text,
              pergunta: pergunta.text,
              resposta: resposta.text,
              updatedByUserId: 1, // 🔥 trocar pelo ID real
            );

            if (widget.kb == null) {
              await controller.create(dto);
            } else {
              await controller.update(widget.kb!.id, dto);
            }

            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
