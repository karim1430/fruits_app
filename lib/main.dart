import 'package:flutter/material.dart';
import 'package:fruits_hub/core/routing/app_router.dart';
import 'package:fruits_hub/feature/splash/presentation/views/splash_view.dart';

void main() {
  runApp(const FruitApp());
}

class FruitApp extends StatelessWidget {
  const FruitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-commerce App',
      home: const SplashView(),
      onGenerateRoute: AppRouter().generateRoute,
    );
  }
}
