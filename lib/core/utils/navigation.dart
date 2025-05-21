import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/utils/locator.dart';
import 'package:food_app/feature/auth/login_and_register_view/presentation/view/complete_register_view.dart';
import 'package:food_app/feature/auth/login_and_register_view/presentation/view/login_and_register_view.dart';
import 'package:food_app/feature/auth/login_and_register_view/presentation/view/login_view.dart';
import 'package:food_app/feature/auth/login_and_register_view/presentation/view/register_view.dart';
import 'package:food_app/feature/home/data/models/food_results.dart';
import 'package:food_app/feature/home/data/repo/home_repo_impl.dart';
import 'package:food_app/feature/home/presentation/view/details_view.dart';
import 'package:food_app/feature/home/presentation/view/home_view.dart';
import 'package:food_app/feature/home/presentation/view/manager/main_food/main_food_cubit.dart';
import 'package:food_app/feature/payment/presentation/view/check_out_view.dart';
import 'package:food_app/feature/payment/presentation/view/thank_you_view.dart';
import 'package:food_app/feature/pop_up/data/models/tasty_api_model/tasty_api_model.dart';
import 'package:food_app/feature/pop_up/data/repo/pop_up_impl.dart';
import 'package:food_app/feature/pop_up/presentation/manager/cubit/meals_food_cubit.dart';
import 'package:food_app/feature/pop_up/presentation/view/breakfast_view.dart';
import 'package:food_app/feature/pop_up/presentation/view/dinner_view.dart';
import 'package:food_app/feature/pop_up/presentation/view/lunch_view.dart';
import 'package:food_app/feature/pop_up/presentation/view/meal_details.dart';
import 'package:food_app/feature/search/data/repo/search_repo_impl.dart';
import 'package:food_app/feature/search/presentation/manager/country_food/country_food_cubit.dart';
import 'package:food_app/feature/search/presentation/manager/food_type_cubit/food_type_cubit.dart';
import 'package:food_app/feature/search/presentation/search_view.dart';
import 'package:food_app/feature/splash/presentation/view/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class RouterNavigation {
  static const kSplashView = '/';
  static const kRegisterView = '/registerView';
  static const kHomeView = '/homeView';
  static const kSearchView = '/searchView';
  static const kDetailsView = '/detailsView';
  static const kMealDetailsView = '/mealDetailsView';
  static const kCompleteRegisterView = '/completeRegisterView';
  static const kLoginView = '/loginView';
  static const kThanksView = '/thanksView';
  static const kBreakfastView = '/BreakfastView';
  static const kLaunchView = '/launchView';
  static const kCheckOutView = '/checkOutView';
  static const kDinnerView = '/DinnerView';
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
        path: kThanksView,
        builder: (BuildContext context, GoRouterState state) {
          return const ThankYouView(totalPrice: 0);
        },
      ),
      GoRoute(
        path: kCheckOutView,
        builder: (BuildContext context, GoRouterState state) {
          return const CheckOutView();
        },
      ),
      GoRoute(
        path: kSearchView,
        builder: (BuildContext context, GoRouterState state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => FoodTypeCubit(getIt<SearchRepoImpl>()),
              ),
              BlocProvider(
                create: (context) => CountryFoodCubit(getIt<SearchRepoImpl>()),
              ),
            ],
            child: const SearchView(),
          );
        },
      ),
      GoRoute(
        path: kDetailsView,
        builder: (BuildContext context, GoRouterState state) {
          return DetailsView(food: state.extra as FoodResults);
        },
      ),
      GoRoute(
        path: kMealDetailsView,
        builder: (BuildContext context, GoRouterState state) {
          return MealDetailsView(food: state.extra as TastyApiModel);
        },
      ),
      GoRoute(
        path: kBreakfastView,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create:
                (context) =>
                    MealsFoodCubit(getIt<PopUpRepoImpl>())
                      ..getMealsMethod(meals: 'breakfast'),
            child: const BreakfastView(),
          );
        },
      ),
      GoRoute(
        path: kLaunchView,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create:
                (context) =>
                    MealsFoodCubit(getIt<PopUpRepoImpl>())
                      ..getMealsMethod(meals: 'lunch'),
            child: const LaunchView(),
          );
        },
      ),
      GoRoute(
        path: kDinnerView,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create:
                (context) =>
                    MealsFoodCubit(getIt<PopUpRepoImpl>())
                      ..getMealsMethod(meals: 'dinner'),
            child: const DinnerView(),
          );
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
        path: kHomeView,
        pageBuilder: (context, state) {
          return customTransitionAnimation(
            state,
            child: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => MainFoodCubit(getIt<HomeRepoImpl>()),
                ),
              ],
              child: const HomeView(),
            ),
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
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.9, end: 1).animate(animation),
            child: child,
          ),
        );
      },
    );
  }
}
