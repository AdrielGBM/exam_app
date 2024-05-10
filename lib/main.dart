import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'services/services.dart';
import '/routes/app_routes.dart';
import '/theme/app_theme.dart';

//Gabriel Silva
//Adriel Barrientos

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => AuthService()),
      ChangeNotifierProvider(create: (_) => ProductService()),
      ChangeNotifierProvider(create: (_) => CategoryService()),
      ChangeNotifierProvider(create: (_) => ProviderService()),
    ], child: const MainApp());
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    const SystemUiOverlayStyle(statusBarColor: Colors.cyan);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Exam app',
        initialRoute: AppRoutes.initialRoute,
        routes: AppRoutes.routes,
        onGenerateRoute: AppRoutes.onGenerateRoute,
        theme: AppTheme.lightTheme);
  }
}
