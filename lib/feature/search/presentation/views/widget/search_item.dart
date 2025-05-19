import 'package:flutter/material.dart';
import 'package:food_app/feature/search/data/model/meals_food.dart';
import 'package:food_app/feature/search/presentation/views/widget/custom_food_cached_image.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({super.key, required this.countryFood});
  final MealsFood countryFood;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        fit: StackFit.expand,
        children: [
          CustomFoodCachedImage(meal: countryFood),
          Container(color: const Color.fromRGBO(0, 0, 0, 0.5)),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(0, 0, 0, 0.5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                countryFood.strMeal ?? "anonymous meal name",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
