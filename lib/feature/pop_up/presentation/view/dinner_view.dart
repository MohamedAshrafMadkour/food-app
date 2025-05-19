import 'package:flutter/material.dart';
import 'package:food_app/core/constant/color_constant.dart';
import 'package:food_app/feature/pop_up/presentation/view/helper/custom_pop_app_bar.dart';
import 'package:food_app/feature/pop_up/presentation/view/widget/meal_body.dart';

class DinnerView extends StatelessWidget {
  const DinnerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAuthColor,
      appBar: customAppBar(context, meal: 'dinner'),
      body: const MealBody(meal: 'dinner'),
    );
  }
}
