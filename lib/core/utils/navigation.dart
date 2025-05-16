import 'package:flutter/material.dart';
import 'package:food_app/feature/auth/login_and_regitser_view/login_and_regitser_view.dart';
import 'package:food_app/feature/splash/presentation/view/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class RouterNavigation {
  static const kSplashView = '/';
  static const kLoginAndRegisterView = '/loginAndRegisterView';
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: kSplashView,
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),

      GoRoute(
        path: kLoginAndRegisterView,
        builder: (BuildContext context, GoRouterState state) {
          return const LoginAndRegisterView();
        },
      ),
    ],
  );
}
