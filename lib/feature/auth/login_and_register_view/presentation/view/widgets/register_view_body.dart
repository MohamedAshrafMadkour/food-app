import 'package:flutter/material.dart';
import 'package:food_app/core/utils/app_images.dart';
import 'package:food_app/core/utils/navigation.dart';
import 'package:food_app/feature/auth/login_and_register_view/presentation/view/widgets/custom_button.dart';
import 'package:food_app/feature/auth/login_and_register_view/presentation/view/widgets/custom_text_form_field.dart';
import 'package:go_router/go_router.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(Assets.imagesLogin1),
              const SizedBox(height: 70),
              const CustomTextFormField(icon: Icons.email, hintText: 'Email'),
              const SizedBox(height: 20),
              const CustomTextFormField(
                icon: Icons.person,
                hintText: 'Username',
              ),
              const SizedBox(height: 20),
              const CustomTextFormField(
                icon: Icons.lock,
                hintText: 'Password',
                sufIcon: Icons.visibility,
              ),
              const SizedBox(height: 40),
              CustomButton(
                onPressed: () {
                  GoRouter.of(
                    context,
                  ).push(RouterNavigation.kCompleteRegisterView);
                },
                text: 'Register',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
