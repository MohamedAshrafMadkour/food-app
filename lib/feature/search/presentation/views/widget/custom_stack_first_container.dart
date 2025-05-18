import 'package:flutter/material.dart';
import 'package:food_app/core/constant/color_constant.dart';

class CustomStackFirstContainer extends StatelessWidget {
  const CustomStackFirstContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: kAuthColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
    );
  }
}
