import 'package:flutter/material.dart';
import 'package:food_app/core/utils/colors.dart';

class CustomFoodContainerHeader extends StatelessWidget {
  const CustomFoodContainerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: const ShapeDecoration(
            shape: CircleBorder(
              side: BorderSide(width: 1, color: AppColors.circleColor),
            ),
            color: Colors.transparent,
          ),
          child: const Center(
            child: CircleAvatar(
              radius: 5,
              backgroundColor: AppColors.circleColor,
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.favorite, color: AppColors.unActiveIconColor),
        ),
      ],
    );
  }
}
