import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Ingresar como invitado",
            style: TextStyle(fontSize: 12, color: Colors.black54),
          ),
        ),
        automaticallyImplyLeading: false,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.cyan),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          color: Colors.white,
          child: Column(
            children: [
              Container(
                height: 500,
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 130),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: const Center(
                      child: Text(
                    "Exam\n    App",
                    style: TextStyle(
                        fontSize: 68,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(context, "registerEmail",
                      arguments: {"first": true}),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.cyan),
                    child: const Text(
                      "Crear cuenta nueva",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, "loginEmail",
                    arguments: {"first": true}),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.cyan[50]),
                  child: const Text(
                    "Iniciar sesión",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.cyan),
                    textAlign: TextAlign.center,
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
