import 'package:flutter/material.dart';
import 'package:food_app/core/utils/colors.dart';
import 'package:food_app/core/utils/navigation.dart';
import 'package:food_app/core/utils/styles.dart';
import 'package:food_app/core/widget/custom_cached_image.dart';
import 'package:food_app/feature/home/data/models/food_results.dart';
import 'package:food_app/feature/home/presentation/view/widgets/container_header.dart';
import 'package:food_app/feature/home/presentation/view/widgets/custom_food_item_price.dart';
import 'package:go_router/go_router.dart';

class HomeFoodItem extends StatelessWidget {
  const HomeFoodItem({super.key, required this.food});
  final FoodResults food;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(RouterNavigation.kDetailsView, extra: food);
      },
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.homeItemContainerColor,
        ),
        child: Container(
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(width: 2, color: Color(0xffC5C5C5)),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomFoodContainerHeader(),
                CustomCachedImage(food: food),
                const SizedBox(height: 12),
                Text(
                  food.title ?? "",
                  style: Styles.textSemiBold12,
                  maxLines: 1,
                ),
                CustomFoodItemPrice(food: food),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
