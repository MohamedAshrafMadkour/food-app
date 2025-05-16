import 'package:flutter/material.dart';
import 'package:food_app/core/utils/navigation.dart';
import 'package:food_app/core/utils/styles.dart';
import 'package:go_router/go_router.dart';

class SignRow extends StatelessWidget {
  const SignRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            GoRouter.of(context).push(RouterNavigation.kRegisterView);
          },
          child: Text(
            'Sign Up',
            style: Styles.textMedium15.copyWith(color: Colors.white),
          ),
        ),
        Text(
          'Forgot Password ?',
          style: Styles.textMedium15.copyWith(color: Colors.black),
        ),
      ],
    );
  }
}
