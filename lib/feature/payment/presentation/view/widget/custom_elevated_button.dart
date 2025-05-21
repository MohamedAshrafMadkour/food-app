import 'package:flutter/material.dart';
import 'package:food_app/core/utils/styles.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    this.onPressed,
    required this.title,
    this.isLoading = false,
  });
  final void Function()? onPressed;
  final String title;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(70),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: const Color(0xff34A853),
      ),
      onPressed: onPressed,
      child:
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : Text(
                title,
                style: Styles.textBold22.copyWith(color: Colors.black),
              ),
    );
  }
}
