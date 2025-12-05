import 'package:flutter/material.dart';
import 'package:chatbot_frontend/src/features/auth/views/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  bool mostrarSenha = false;

  String get senhaForca {
    final s = senhaController.text;
    if (s.isEmpty) return '';
    if (s.length < 8) return 'senha fraca';
    if (s.length < 12) return 'senha média';
    return 'senha forte';
  }

  Color get senhaForcaColor {
    final s = senhaController.text;
    if (s.isEmpty) return Colors.transparent;
    if (s.length < 8) return const Color(0xFFFFC107);
    if (s.length < 12) return Colors.orange;
    return const Color(0xFF57733C);
  }

  static const Color primaryGreen = Color(0xFF57733C);

  InputDecoration baseDecoration({required String hint, Widget? suffix}) {
    return InputDecoration(
      hintText: hint,
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: primaryGreen),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: primaryGreen, width: 2),
      ),
      suffixIcon: suffix,
    );
  }

  void criarConta() {
    Navigator.of(context).pushReplacementNamed('/chat');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 80),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  height: 80,
                  'assets/imagens/capivaria.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Crie sua conta no Patricia",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Tire suas dúvidas com o chatbot inteligente', //trocaar nome
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 20),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Seu nome',
                  style: TextStyle(fontSize: 13, color: Colors.grey[800]),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: nomeController,
                cursorColor: primaryGreen,
                decoration: baseDecoration(hint: 'Nome sobrenome'),
              ),

              const SizedBox(height: 18),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Seu email',
                  style: TextStyle(fontSize: 13, color: Colors.grey[800]),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                cursorColor: primaryGreen,
                decoration: baseDecoration(hint: 'seuemail@gmail.com'),
              ),

              const SizedBox(height: 18),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Criar senha',
                  style: TextStyle(fontSize: 13, color: Colors.grey[800]),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: senhaController,
                obscureText: !mostrarSenha,
                onChanged: (_) => setState(() {}),
                cursorColor: primaryGreen,
                decoration: baseDecoration(
                  hint: '123456789',
                  suffix: IconButton(
                    icon: Icon(
                      mostrarSenha ? Icons.visibility_off : Icons.visibility,
                      color: primaryGreen,
                    ),
                    onPressed: () =>
                        setState(() => mostrarSenha = !mostrarSenha),
                  ),
                ),
              ),

              const SizedBox(height: 6),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  senhaForca,
                  style: TextStyle(
                    fontSize: 12,
                    color: senhaForca.isEmpty
                        ? Colors.transparent
                        : senhaForcaColor,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: criarConta,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Criar conta',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
