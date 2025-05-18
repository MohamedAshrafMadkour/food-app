import 'package:flutter/material.dart';
import 'package:food_app/feature/search/presentation/views/widget/custom_row_card.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Icon(Icons.favorite, color: Colors.grey),
            Padding(
              padding: EdgeInsets.only(right: 24, left: 8),
              child: CustomCardRow(),
            ),
          ],
        ),
      ),
    );
  }
}
