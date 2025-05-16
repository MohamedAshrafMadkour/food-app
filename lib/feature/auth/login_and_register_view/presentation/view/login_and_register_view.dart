import 'package:flutter/material.dart';
import 'package:food_app/core/constant/color_constant.dart';
import 'package:food_app/feature/auth/login_and_register_view/presentation/view/widgets/custom_login_and_register_view_body.dart';

class LoginAndRegisterView extends StatelessWidget {
  const LoginAndRegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kAuthColor,
      body: CustomLoginAndRegisterViewBody(),
    );
  }
}
