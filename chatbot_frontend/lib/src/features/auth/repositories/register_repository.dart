import 'package:chatbot_frontend/src/features/auth/models/user.dart';

import 'user_model.dart';

class AuthRepository {
  Future<UserModel?> register(String name, String email, String password) async {
    // Simula chamada a API
    await Future.delayed(const Duration(seconds: 1));

    return UserModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      email: email,
    );
  }
}
