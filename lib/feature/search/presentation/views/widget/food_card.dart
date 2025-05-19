import 'package:flutter/material.dart';
import 'package:food_app/feature/search/data/model/meals_food.dart';
import 'package:food_app/feature/search/presentation/views/widget/custom_row_card.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({super.key, required this.meal});
  final MealsFood meal;
  @override
  Widget build(BuildContext context) {
    return Card(
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
              child: CustomFoodCardRow(meal: meal),
            ),
          ],
        ),
      ),
    );
  }
}
