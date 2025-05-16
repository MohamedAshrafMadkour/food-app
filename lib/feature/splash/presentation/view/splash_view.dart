import 'package:flutter/material.dart';
import 'package:food_app/core/utils/styles.dart';
import 'package:food_app/feature/splash/presentation/view/widget/custom_splash_body.dart';
import 'package:go_router/go_router.dart';
import 'package:food_app/core/utils/navigation.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> logoScale;
  late Animation<Offset> logoSlide;
  late Animation<double> textFade;

  @override
  void initState() {
    super.initState();

    customAnimationMethod();

    customNavigationMethod();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomSplashBody(
        logoSlide: logoSlide,
        logoScale: logoScale,
        textFade: textFade,
      ),
    );
  }

  void customNavigationMethod() {
    Future.delayed(const Duration(seconds: 3), () {
      context.go(RouterNavigation.kLoginAndRegisterView);
    });
  }

  void customAnimationMethod() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    logoScale = Tween<double>(
      begin: 0.6,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    logoSlide = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    textFade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1.0, curve: Curves.easeIn),
      ),
    );

    _controller.forward();
  }
}
