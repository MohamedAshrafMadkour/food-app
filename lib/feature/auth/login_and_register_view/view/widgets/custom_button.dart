import 'package:flutter/material.dart';
import 'package:food_app/core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, this.onPressed});
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(320, 60),
        backgroundColor: const Color(0xffDFB497),
      ),
      onPressed: onPressed,
      child: Text(text, style: Styles.textRegular23),
    );
  }
}
