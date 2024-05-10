import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/widgets/widgets.dart';

class LoginEmailScreen extends StatelessWidget {
  const LoginEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const SimpleUpperBar(
          screenName: "Iniciar sesión",
          color: Colors.black,
        ),
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.cyan),
        backgroundColor: Colors.white,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        color: Colors.white,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 24),
              child: Text(
                "Ingresa tus datos para iniciar sesión",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 12),
              child: SimpleForm(
                isLogIn: true,
                resetPassword: true,
                route: "home",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
