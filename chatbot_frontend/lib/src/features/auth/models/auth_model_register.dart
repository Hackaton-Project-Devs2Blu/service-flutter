import 'package:chatbot_frontend/src/features/auth/models/user.dart';

class AuthModel {
  final User user;
  final String token;

  AuthModel({required this.user, required this.token});

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    // espera estrutura: { "user": { ... }, "token": "..." }
    return AuthModel(
      user: User.fromJson(json['user'] ?? {}),
      token: json['token']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() => {'user': user.toJson(), 'token': token};
}
