import 'package:flutter/material.dart';
import 'package:food_app/core/utils/colors.dart';
import 'package:food_app/core/utils/styles.dart';
import 'package:food_app/core/widget/custom_icon.dart';

class CustomFoodItemPrice extends StatelessWidget {
  const CustomFoodItemPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(r'$1500.00', style: Styles.textSemiBold15),
        CustomIcon(
          icon: Icons.add_circle,
          color: AppColors.circleColor,
          size: 28,
        ),
      ],
    );
  }
}
