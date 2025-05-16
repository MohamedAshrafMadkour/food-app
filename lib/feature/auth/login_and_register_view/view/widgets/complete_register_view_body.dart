import 'package:flutter/material.dart';
import 'package:food_app/core/utils/app_images.dart';
import 'package:food_app/core/utils/styles.dart';
import 'package:food_app/feature/auth/login_and_register_view/view/widgets/custom_button.dart';

class CompleteRegisterViewBody extends StatelessWidget {
  const CompleteRegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(Assets.imagesIllustration),
          const SizedBox(height: 60),
          const Text('Registration', style: Styles.textBold30),
          const Text('Complete', style: Styles.textBold30),
          const SizedBox(height: 60),
          const CustomButton(text: 'Continue'),
        ],
      ),
    );
  }
}
