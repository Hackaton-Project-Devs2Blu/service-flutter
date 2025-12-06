import 'dart:convert';

class KnowledgeBase {
  final int id;
  final String titulo;
  final String categoria;
  final String conteudo;
  final String atualizadoEm;
  final int atualizadoPor;

  KnowledgeBase({
    required this.id,
    required this.titulo,
    required this.categoria,
    required this.conteudo,
    required this.atualizadoEm,
    required this.atualizadoPor,
  });

  factory KnowledgeBase.fromJson(Map<String, dynamic> json) {
    return KnowledgeBase(
      id: json['id'],
      titulo: json['titulo'],
      categoria: json['categoria'],
      conteudo: json['resposta'],
      atualizadoEm: json['updatedAt'],
      atualizadoPor: 0,
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "titulo": titulo,
    "categoria": categoria,
    "conteudo": conteudo,
    "atualizado_por": atualizadoPor,
  };
}
