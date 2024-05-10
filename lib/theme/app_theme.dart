import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
      primaryColor: Colors.cyan,
      brightness: Brightness.light,
      fontFamily: "Roboto",
      appBarTheme: const AppBarTheme(color: Colors.cyan),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              foregroundColor: Colors.white, backgroundColor: Colors.cyan)),
      floatingActionButtonTheme:
          const FloatingActionButtonThemeData(backgroundColor: Colors.cyan));
}
