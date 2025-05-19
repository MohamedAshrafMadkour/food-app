import 'package:flutter/material.dart';
import 'package:food_app/core/widget/custom_icon.dart';
import 'package:food_app/feature/auth/login_and_register_view/presentation/view/widgets/custom_button.dart';
import 'package:food_app/feature/home/presentation/view/widgets/counter.dart';
import 'package:food_app/feature/pop_up/data/models/tasty_api_model/tasty_api_model.dart';
import 'package:food_app/feature/pop_up/presentation/view/widget/custom_meal_details_data_row.dart';
import 'package:food_app/feature/pop_up/presentation/view/widget/custom_meal_details_description.dart';
import 'package:food_app/feature/pop_up/presentation/view/widget/custom_meal_details_image.dart';
import 'package:food_app/feature/pop_up/presentation/view/widget/cutsom_meal_details_time.dart';

class MealDetailsViewBody extends StatelessWidget {
  const MealDetailsViewBody({super.key, required this.food});
  final TastyApiModel food;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomMealDetailsImage(food: food),
          ),
          const SizedBox(height: 40),
          CustomMealDetailsDataRow(food: food),
          CustomMealDetailsDescription(food: food),
          const SizedBox(height: 20),
          CustomMealDetailsTime(food: food),
          const SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomIcon(icon: Icons.favorite, color: Colors.red, size: 36),
                CustomCounter(),
              ],
            ),
          ),
          const SizedBox(height: 40),
          const Center(child: CustomButton(text: 'Add To Cart')),
        ],
      ),
    );
  }
}
