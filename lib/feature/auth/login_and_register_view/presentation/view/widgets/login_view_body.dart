import 'package:flutter/material.dart';
import 'package:food_app/core/utils/app_images.dart';
import 'package:food_app/core/utils/styles.dart';
import 'package:food_app/feature/auth/login_and_register_view/presentation/view/widgets/custom_button.dart';
import 'package:food_app/feature/auth/login_and_register_view/presentation/view/widgets/custom_text_form_field.dart';
import 'package:food_app/feature/auth/login_and_register_view/presentation/view/widgets/sign_row.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(Assets.imagesStanding),
              const SizedBox(height: 30),
              const Text('Welcome Back', style: Styles.textBold30),
              const SizedBox(height: 8),
              const Text(
                'Lorem ipsum dolor sit amet, consectetur',
                style: Styles.textLight13,
              ),
              const Text(
                'adipiscing elit. Diam maecenas mi non sed ut',
                style: Styles.textLight13,
              ),
              const Text(
                'odio. Non, justo, sed facilisi et.',
                style: Styles.textLight13,
              ),
              const SizedBox(height: 30),
              const CustomTextFormField(
                hintStyle: Styles.textMedium15,
                icon: Icons.person,
                hintText: 'Username , Email',
              ),
              const SizedBox(height: 20),
              const CustomTextFormField(
                hintStyle: Styles.textMedium15,
                icon: Icons.person,
                hintText: 'Password',
              ),
              const SizedBox(height: 12),
              const SignRow(),
              const SizedBox(height: 30),
              const CustomButton(text: 'Login'),
            ],
          ),
        ),
      ),
    );
  }
}
