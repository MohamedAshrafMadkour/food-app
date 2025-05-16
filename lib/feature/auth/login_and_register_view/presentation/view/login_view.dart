import 'package:flutter/material.dart';
import 'package:food_app/core/constant/color_constant.dart';
import 'package:food_app/feature/auth/login_and_register_view/presentation/view/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: kAuthColor,
      body: LoginViewBody(),
    );
  }
}
