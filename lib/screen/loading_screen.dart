import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.cyan),
        backgroundColor: Colors.white,
      ),
      body: Container(color: Colors.white),
    );
  }
}
