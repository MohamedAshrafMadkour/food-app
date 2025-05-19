import 'package:flutter/material.dart';
import 'package:food_app/core/widget/custom_icon.dart';
import 'package:food_app/feature/pop_up/data/models/tasty_api_model/tasty_api_model.dart';
import 'package:food_app/feature/pop_up/presentation/view/widget/meal_details_view_body.dart';
import 'package:go_router/go_router.dart';

class MealDetailsView extends StatelessWidget {
  const MealDetailsView({super.key, required this.food});
  final TastyApiModel food;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: CustomIcon(
          icon: Icons.arrow_back_ios,
          size: 24,
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
        actions: [
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(3.1416),
            child: const CustomIcon(icon: Icons.sort, size: 36),
          ),
        ],
      ),
      body: MealDetailsViewBody(food: food),
    );
  }
}
