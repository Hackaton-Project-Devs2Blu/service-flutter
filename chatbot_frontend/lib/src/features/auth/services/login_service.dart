// ...existing code...
import 'package:chatbot_frontend/src/services/auth_service.dart';
import 'package:chatbot_frontend/src/features/auth/models/auth_model_login.dart';

class LoginService {
  final AuthService service;

  LoginService({required this.service});

  /// Retorna AuthModel em caso de sucesso, ou null em falha.
  Future<AuthModel?> login(String email, String password) async {
    try {
      return await service.login(email, password);
    } catch (_) {
      return null;
    }
  }

  void dispose() => service.dispose();
}
// ...existing code...