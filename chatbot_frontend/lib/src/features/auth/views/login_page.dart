import 'package:flutter/material.dart';
import 'package:chatbot_frontend/src/features/chatbot/views/chat_page.dart';
import 'package:chatbot_frontend/src/features/auth/views/register_peage.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  bool mostrarSenha = false;
  bool senhaErro = false;

  final emailController = TextEditingController();
  final senhaController = TextEditingController();

  final String emailAdmin = "admin@gmail.com";
  final String senhaAdmin = "123456";

  static const Color primaryGreen = Color(0xFF57733C);

  void validarLogin() {
    if (emailController.text.trim() == emailAdmin &&
        senhaController.text.trim() == senhaAdmin) {
      setState(() {
        senhaErro = false;
      });

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ChatPage()),
      );
    } else {
      setState(() {
        senhaErro = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),

              const Text("Seu email"),
              const SizedBox(height: 6),
              TextField(
                controller: emailController,
                cursorColor: primaryGreen,
                decoration: InputDecoration(
                  hintText: "seuemail@gmail.com",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: primaryGreen),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: primaryGreen, width: 2),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              const Text("Senha"),
              const SizedBox(height: 6),
              TextField(
                controller: senhaController,
                obscureText: !mostrarSenha,
                cursorColor: primaryGreen,
                decoration: InputDecoration(
                  hintText: "Digite sua senha",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                        color: senhaErro ? Colors.red : primaryGreen),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: senhaErro ? Colors.red : primaryGreen,
                      width: 2,
                    ),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      mostrarSenha ? Icons.visibility : Icons.visibility_off,
                      color: primaryGreen,
                    ),
                    onPressed: () {
                      setState(() {
                        mostrarSenha = !mostrarSenha;
                      });
                    },
                  ),
                ),
              ),

              const SizedBox(height: 6),

              if (senhaErro)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Senha ou email incorretos",
                      style: TextStyle(color: Colors.red, fontSize: 13),
                    ),
                    Text(
                      "Esqueceu a senha?",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )
              else
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Esqueceu a senha?",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: validarLogin,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Entrar",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              Row(
                children: const [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text("ou", style: TextStyle(color: Colors.grey)),
                  ),
                  Expanded(child: Divider()),
                ],
              ),

              const SizedBox(height: 25),

              // ======================
              // ➜ REDIRECIONA PARA REGISTER PAGE
              // ======================
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterPage(),
                      ),
                    );
                  },
                  child: RichText(
                    text: const TextSpan(
                      text: "Não tem uma conta? ",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                      children: [
                        TextSpan(
                          text: "Criar uma",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
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
