import 'package:flutter/material.dart';
import 'package:food_app/feature/search/presentation/views/widget/food_card_list.dart';

class MealBody extends StatelessWidget {
  const MealBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: CustomScrollView(slivers: [FoodCardList()]),
    );
  }
}
