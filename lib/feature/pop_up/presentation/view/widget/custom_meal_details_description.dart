import 'package:flutter/material.dart';
import 'package:food_app/core/utils/styles.dart';
import 'package:food_app/feature/pop_up/data/models/tasty_api_model/tasty_api_model.dart';

class CustomMealDetailsDescription extends StatelessWidget {
  const CustomMealDetailsDescription({super.key, required this.food});
  final TastyApiModel food;
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -12),
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            const Text('About this product : ', style: Styles.textMedium18),
            Text(
              food.description ?? "No description",
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              style: Styles.textRegular14,
            ),
          ],
        ),
      ),
    );
  }
}
