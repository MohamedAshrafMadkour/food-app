import 'package:flutter/material.dart';
import 'package:food_app/core/utils/app_images.dart';
import 'package:food_app/core/utils/colors.dart';
import 'package:food_app/core/utils/styles.dart';
import 'package:food_app/feature/home/presentation/view/widgets/container_header.dart';
import 'package:food_app/feature/home/presentation/view/widgets/custom_food_item_price.dart';

class HomeFoodItem extends StatelessWidget {
  const HomeFoodItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: AppColors.homeItemContainerColor),
      child: Container(
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(width: 1),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomFoodContainerHeader(),
              Center(
                child: ClipRRect(
                  child: Image.asset(
                    Assets.imagesDash,
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              const Text('Egg Paprica', style: Styles.textSemiBold12),
              const CustomFoodItemPrice(),
            ],
          ),
        ),
      ),
    );
  }
}
