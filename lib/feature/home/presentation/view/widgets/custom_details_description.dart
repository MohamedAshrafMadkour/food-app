import 'package:flutter/material.dart';
import 'package:food_app/core/utils/styles.dart';
import 'package:food_app/feature/home/data/models/food_results.dart';

class CustomDetailsDescription extends StatelessWidget {
  const CustomDetailsDescription({super.key, required this.food});
  final FoodResults food;
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
              food.summary ?? " ",
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
