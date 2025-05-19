import 'package:flutter/material.dart';
import 'package:food_app/core/utils/navigation.dart';
import 'package:food_app/feature/pop_up/data/models/tasty_api_model/tasty_api_model.dart';
import 'package:food_app/feature/pop_up/presentation/view/widget/custom_meal_card.dart';
import 'package:go_router/go_router.dart';

class MealCard extends StatelessWidget {
  const MealCard({super.key, required this.meal});
  final TastyApiModel meal;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(
          context,
        ).push(RouterNavigation.kMealDetailsView, extra: meal);
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Icon(Icons.favorite, color: Colors.grey),
              Padding(
                padding: const EdgeInsets.only(right: 24, left: 8),
                child: CustomMealCardRow(meal: meal),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
