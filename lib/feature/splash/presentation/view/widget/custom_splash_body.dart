import 'package:flutter/material.dart';
import 'package:food_app/core/utils/styles.dart';

class CustomSplashBody extends StatelessWidget {
  const CustomSplashBody({
    super.key,
    required this.logoSlide,
    required this.logoScale,
    required this.textFade,
  });

  final Animation<Offset> logoSlide;
  final Animation<double> logoScale;
  final Animation<double> textFade;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff236969), Color(0xff4ba5a5)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SlideTransition(
              position: logoSlide,
              child: ScaleTransition(
                scale: logoScale,
                child: const Icon(
                  Icons.food_bank,
                  size: 100,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            FadeTransition(
              opacity: textFade,
              child: const Text('Foodie', style: Styles.textBold28),
            ),
          ],
        ),
      ),
    );
  }
}
