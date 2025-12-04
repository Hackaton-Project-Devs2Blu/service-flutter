import 'package:flutter/material.dart';

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
    if (s.length < 8) return const Color(0xFFFFC107); // amarelo
    if (s.length < 12) return Colors.orange;
    return const Color(0xFF57733C); // verde forte
  }

  static const Color primaryGreen = Color(0xFF57733C);

  @override
  void dispose() {
    nomeController.dispose();
    emailController.dispose();
    senhaController.dispose();
    super.dispose();
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            children: [
              const SizedBox(height: 8),

              // Seu nome
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

              // Seu email
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

              // Criar senha
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

              // senha fraca / forte
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

              // Botão Criar conta
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    // implementar ação de criar conta
                  },
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

// filepath: c:\repo\service-flutter\chatbot_frontend\lib\src\features\auth\views\register_page.dart
