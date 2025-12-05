import 'package:chatbot_frontend/src/features/auth/models/user.dart';
import 'package:chatbot_frontend/src/features/auth/repositories/register_repository.dart';



class AuthService {
  final AuthRepository repository;

  AuthService(this.repository);

  Future<UserModel?> register(String name, String email, String password) {
    return repository.register(name, email, password);
  }
}
