import 'package:flutter/material.dart';
import 'package:food_app/core/constant/color_constant.dart';
import 'package:food_app/feature/auth/login_and_register_view/presentation/view/widgets/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kAuthColor,
      body: RegisterViewBody(),
    );
  }
}
