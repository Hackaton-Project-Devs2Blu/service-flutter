import 'package:chatbot_frontend/src/features/auth/models/user.dart';
import 'package:chatbot_frontend/src/features/auth/services/register_service.dart';



class RegisterController {
  final AuthService service;

  RegisterController(this.service);

  Future<UserModel?> createAccount(String name, String email, String password) {
    return service.register(name, email, password);
  }
}
