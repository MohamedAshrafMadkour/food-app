import 'package:flutter/material.dart';
import 'package:food_app/core/utils/colors.dart';
import 'package:food_app/core/utils/styles.dart';
import 'package:food_app/core/widget/custom_icon.dart';
import 'package:food_app/feature/home/data/models/food_results.dart';

class CustomFoodItemPrice extends StatelessWidget {
  const CustomFoodItemPrice({super.key, required this.food});
  final FoodResults food;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          r'$'
          '${food.pricePerServing}',
          style: Styles.textSemiBold15,
        ),
        const CustomIcon(
          icon: Icons.add_circle,
          color: AppColors.circleColor,
          size: 28,
        ),
      ],
    );
  }
}
