import 'package:flutter/material.dart';
import 'package:food_app/feature/splash/presentation/view/splash_view.dart';

void main() {
  runApp(const FoodApp());
}

class FoodApp extends StatelessWidget {
  const FoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'),
      home: const SplashView(),
    );
  }
}
