import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:chatbot_frontend/src/features/auth/models/auth_model_login.dart';
import 'package:chatbot_frontend/src/features/auth/models/user.dart';

class AuthService {
  final String? baseUrl;
  final http.Client _client;

  AuthService({this.baseUrl, http.Client? client})
    : _client = client ?? http.Client();

  Future<AuthModel?> login(String email, String password) async {
    if (baseUrl == null) {
      return fakeLogin(email, password);
    }

    final uri = Uri.parse('$baseUrl/auth/login');
    final res = await _client.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (res.statusCode == 200) {
      final Map<String, dynamic> body = jsonDecode(res.body);
      return AuthModel.fromJson(body);
    }

    return null;
  }

  Future<AuthModel> fakeLogin(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 300));
    const emailAdmin = 'admin@gmail.com';
    const senhaAdmin = '123456';

    if (email.trim() == emailAdmin && password.trim() == senhaAdmin) {
      final user = User(id: '1', name: 'Admin', email: emailAdmin);
      return AuthModel(user: user, token: 'fake-jwt-token');
    }

    throw Exception('Credenciais inválidas');
  }

  void dispose() => _client.close();
}
