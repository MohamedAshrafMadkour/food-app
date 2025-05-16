import 'package:flutter/material.dart';
import 'package:food_app/core/utils/navigation.dart';

void main() {
  runApp(const FoodApp());
}

class FoodApp extends StatelessWidget {
  const FoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: RouterNavigation.router,
      theme: ThemeData(fontFamily: 'Poppins'),
    );
  }
}
