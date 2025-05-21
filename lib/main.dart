import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:food_app/core/constant/box.dart';
import 'package:food_app/core/utils/apy_keys.dart';
import 'package:food_app/core/utils/locator.dart';
import 'package:food_app/core/utils/navigation.dart';
import 'package:food_app/core/utils/observe.dart';
import 'package:food_app/feature/auth/login_and_register_view/presentation/manager/cubit/auth_cubit.dart';
import 'package:food_app/feature/home/data/models/cart_model.dart';
import 'package:food_app/feature/home/data/models/favorite_model.dart';
import 'package:food_app/feature/home/presentation/view/manager/add_favorite_cubit/add_favorite_cubit.dart';
import 'package:food_app/feature/home/presentation/view/manager/cart_cubit/cart_cubit.dart';
import 'package:food_app/feature/home/presentation/view/manager/cubit/display_favorite_cubit_cubit.dart';
import 'package:food_app/feature/home/presentation/view/manager/display_cart/display_cart_cubit.dart';
import 'package:food_app/firebase_options.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  setupServiceLocator();
  Bloc.observer = SimpleBlocObserve();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.initFlutter();
  Hive.registerAdapter(CartModelAdapter());
  await Hive.openBox<CartModel>(kCartBox);
  Hive.registerAdapter(FavoriteModelAdapter());
  await Hive.openBox<FavoriteModel>(kFavBox);
  Stripe.publishableKey = stripePublishableKey;
  runApp(const FoodApp());
}

class FoodApp extends StatelessWidget {
  const FoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => CartCubit()),
        BlocProvider(create: (context) => AddFavoriteCubit()),
        BlocProvider(create: (context) => DisplayCartCubit()),
        BlocProvider(create: (context) => DisplayFavoriteCubitCubit()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: RouterNavigation.router,
        theme: ThemeData(fontFamily: 'Poppins'),
      ),
    );
  }
}
