import 'package:flutter/material.dart';
import 'package:food_app/core/utils/styles.dart';
import 'package:food_app/feature/pop_up/data/models/tasty_api_model/tasty_api_model.dart';
import 'package:food_app/feature/search/presentation/views/widget/custom_meal_cached_image.dart';

class CustomMealCardRow extends StatelessWidget {
  const CustomMealCardRow({super.key, required this.meal});
  final TastyApiModel meal;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(meal.name ?? " ", style: Styles.textRegular18),
              const SizedBox(height: 4),
              Text(
                meal.description ?? " ",
                style: Styles.textRegular13,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Text(meal.country ?? " ", style: Styles.textSemiBold15),
            ],
          ),
        ),
        const SizedBox(width: 12),
        CustomMealCachedImage(meal: meal),
      ],
    );
  }
}
