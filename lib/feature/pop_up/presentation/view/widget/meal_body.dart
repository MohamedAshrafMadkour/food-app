import 'package:flutter/material.dart';
import 'package:food_app/feature/pop_up/presentation/view/widget/meal_card_list.dart';

class MealBody extends StatelessWidget {
  const MealBody({super.key, required this.meal});
  final String meal;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 8),
      child: CustomScrollView(slivers: [MealCardList(meal: meal)]),
    );
  }
}
