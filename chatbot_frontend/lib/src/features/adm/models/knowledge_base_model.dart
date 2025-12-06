class KnowledgeBase {
  final int id;
  final String titulo;
  final String pergunta;
  final String resposta;
  final String categoria;
  final DateTime atualizadoEm;
  final String atualizadoPor;

  KnowledgeBase({
    required this.id,
    required this.titulo,
    required this.pergunta,
    required this.resposta,
    required this.categoria,
    required this.atualizadoEm,
    required this.atualizadoPor,
  });

  factory KnowledgeBase.fromJson(Map<String, dynamic> json) {
    return KnowledgeBase(
      id: json['id'],
      titulo: json['titulo'],
      pergunta: json['pergunta'],
      resposta: json['resposta'],
      categoria: json['categoria'],
      atualizadoEm: DateTime.parse(json['updatedAt']),
      atualizadoPor: json['updatedByName'],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "titulo": titulo,
    "pergunta": pergunta,
    "resposta": resposta,
    "categoria": categoria,
    "updatedAt": atualizadoEm,
    "updatedByName": atualizadoPor,
  };
}
