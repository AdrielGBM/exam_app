import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/providers.dart';
import '../services/services.dart';

class SimpleForm extends StatelessWidget {
  final bool isLogIn;
  final bool resetPassword;
  final String route;
  const SimpleForm(
      {super.key,
      required this.isLogIn,
      this.resetPassword = false,
      required this.route});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ChangeNotifierProvider(
        create: (_) => LoginFormProvider(),
        child: LoginForm(
            isLogIn: isLogIn, resetPassword: resetPassword, route: route),
      ),
    ]);
  }
}

class LoginForm extends StatelessWidget {
  final bool isLogIn;
  final bool resetPassword;
  final String route;
  const LoginForm(
      {super.key,
      required this.isLogIn,
      required this.resetPassword,
      required this.route});

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Form(
      key: loginForm.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(children: [
        TextFormField(
          autocorrect: false,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              label: const Text("Correo electrónico"),
              contentPadding: const EdgeInsets.all(16),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              prefixIcon: const Icon(
                Icons.email,
                color: Colors.cyan,
              )),
          onChanged: (value) => loginForm.email = value,
          validator: (value) {
            return (value != null && value.length >= 6)
                ? null
                : "Correo inválido. Ejemplo: a@a.cl";
          },
        ),
        const SizedBox(height: 30),
        TextFormField(
          autocorrect: false,
          keyboardType: TextInputType.text,
          obscureText: true,
          decoration: InputDecoration(
              label: const Text("Contraseña"),
              contentPadding: const EdgeInsets.all(16),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              prefixIcon: const Icon(
                Icons.password,
                color: Colors.cyan,
              )),
          onChanged: (value) => loginForm.password = value,
          validator: (value) {
            return (value != null && value.length >= 4)
                ? null
                : 'Contraseña demasiado corta.';
          },
        ),
        const SizedBox(height: 30),
        MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          disabledColor: Colors.grey,
          color: Colors.cyan,
          elevation: 0,
          onPressed: loginForm.isLoading
              ? null
              : () async {
                  FocusScope.of(context).unfocus();
                  final authService =
                      Provider.of<AuthService>(context, listen: false);
                  if (!loginForm.isValidForm()) return;
                  loginForm.isLoading = true;
                  if (isLogIn) {
                    final String? idToken = await authService.login(
                        loginForm.email, loginForm.password);
                    if (idToken != null) {
                      if (!context.mounted) return;
                      Navigator.pushNamed(context, route,
                          arguments: {"idToken": idToken});
                    }
                    loginForm.isLoading = false;
                  } else {
                    final String? idToken = await authService.register(
                        loginForm.email, loginForm.password);
                    if (idToken != null) {
                      if (!context.mounted) return;
                      Navigator.pushNamed(context, route,
                          arguments: {"idToken": idToken});
                    }
                    loginForm.isLoading = false;
                  }
                },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: const Text(
              'Continuar',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Builder(builder: (context) {
          if (resetPassword) {
            return MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              disabledColor: Colors.grey,
              color: Colors.white,
              elevation: 0,
              onPressed: loginForm.isLoading
                  ? null
                  : () async {
                      FocusScope.of(context).unfocus();
                      final authService =
                          Provider.of<AuthService>(context, listen: false);
                      if (!loginForm.isValidForm()) return;
                      loginForm.isLoading = true;
                      final String? errorMessage =
                          await authService.resetPassword(loginForm.email);
                      if (errorMessage == null) {
                        if (!context.mounted) return;
                        Navigator.pushNamed(context, "loginResetPassword");
                      }
                      loginForm.isLoading = false;
                    },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: const Text(
                  'Olvidé mi contraseña',
                  style: TextStyle(
                      color: Colors.cyan, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }
          return const Text("");
        })
      ]),
    );
  }
}
