import 'package:flutter/material.dart';
import 'package:food_app/feature/search/presentation/views/widget/food_card.dart';

class FoodCardList extends StatelessWidget {
  const FoodCardList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => const FoodCard(),
        childCount: 10,
      ),
    );
  }
}
