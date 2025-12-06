class CreateKnowledgeBaseDto {
  final String titulo;
  final String pergunta;
  final String resposta;
  final String categoria;
  final int updatedByUserId;

  CreateKnowledgeBaseDto({
    required this.titulo,
    required this.pergunta,
    required this.resposta,
    required this.categoria,
    required this.updatedByUserId,
  });

  Map<String, dynamic> toJson() {
    return {
      "titulo": titulo,
      "pergunta": pergunta,
      "resposta": resposta,
      "categoria": categoria,
      "updatedByUserId": updatedByUserId,
    };
  }
}
