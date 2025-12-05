import 'package:flutter/foundation.dart';
import 'package:chatbot_frontend/src/features/auth/models/user.dart';
import 'package:chatbot_frontend/src/features/auth/models/auth_model_login.dart';

class AuthController extends ChangeNotifier {
  User? _user;
  String? _token;

  User? get user => _user;
  String? get token => _token;
  bool get isLogged => _user != null;

  /// Simula login; substitua pela chamada real à API quando disponível.
  Future<bool> login(String email, String senha) async {
    await Future.delayed(const Duration(milliseconds: 300)); // simula latência

    const emailAdmin = 'admin@gmail.com';
    const senhaAdmin = '123456';

    if (email.trim() == emailAdmin && senha.trim() == senhaAdmin) {
      _user = User(id: '1', name: 'Admin', email: emailAdmin);
      _token = 'fake-jwt-token';
      notifyListeners();
      return true;
    }

    return false;
  }

  void logout() {
    _user = null;
    _token = null;
    notifyListeners();
  }
}
