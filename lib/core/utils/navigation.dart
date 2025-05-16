import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:food_app/feature/auth/login_and_register_view/view/complete_register_view.dart';
import 'package:food_app/feature/auth/login_and_register_view/view/login_and_register_view.dart';
import 'package:food_app/feature/auth/login_and_register_view/view/login_view.dart';
import 'package:food_app/feature/auth/login_and_register_view/view/register_view.dart';
import 'package:food_app/feature/splash/presentation/view/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class RouterNavigation {
  static const kSplashView = '/';
  static const kRegisterView = '/registerView';
  static const kCompleteRegisterView = '/completeRegisterView';
  static const kLoginView = '/loginView';
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
        path: kRegisterView,
        pageBuilder: (context, state) {
          return customTransitionAnimation(state, child: const RegisterView());
        },
      ),
      GoRoute(
        path: kCompleteRegisterView,
        pageBuilder: (context, state) {
          return customTransitionAnimation(
            state,
            child: const CompleteRegisterView(),
          );
        },
      ),
      GoRoute(
        path: kLoginView,
        pageBuilder: (context, state) {
          return customTransitionAnimation(state, child: const LoginView());
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

  static CustomTransitionPage<dynamic> customTransitionAnimation(
    GoRouterState state, {
    required Widget child,
  }) {
    return CustomTransitionPage(
      key: state.pageKey,
      reverseTransitionDuration: const Duration(milliseconds: 400),
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SharedAxisTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          transitionType: SharedAxisTransitionType.vertical,
          child: child,
        );
      },
    );
  }
}
