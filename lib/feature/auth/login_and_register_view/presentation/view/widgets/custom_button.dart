import 'package:flutter/material.dart';
import 'package:food_app/core/constant/color_constant.dart';
import 'package:food_app/core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
  });
  final String text;
  final void Function()? onPressed;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(305, 60),
        backgroundColor: const Color(0xffDFB497),
      ),
      onPressed: onPressed,
      child:
          isLoading
              ? const CircularProgressIndicator(color: kAuthColor)
              : Text(text, style: Styles.textRegular23),
    );
  }
}
