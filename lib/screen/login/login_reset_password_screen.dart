import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/widgets/widgets.dart';

class LoginResetPasswordScreen extends StatelessWidget {
  const LoginResetPasswordScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const SimpleUpperBar(
          screenName: "Recuperar contraseña",
        ),
        automaticallyImplyLeading: false,
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: Colors.cyan[100]),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          color: Colors.white,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 24),
              child: Text(
                "En su correo están las instrucciones para cambiar de contraseña",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(86),
              height: 400,
              child: const Center(
                child: Image(
                    image: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQLHfWQhWZsD6aaeECDvk_ZnLXWVIt6Td5odejcvF64oGO8PJ1")),
              ),
            ),
            GestureDetector(
              onTap: () =>
                  Navigator.pushReplacementNamed(context, "loginEmail"),
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
          ]),
        ),
      ),
    );
  }
}
