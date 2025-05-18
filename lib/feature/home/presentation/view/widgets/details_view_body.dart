import 'package:flutter/material.dart';
import 'package:food_app/core/widget/custom_icon.dart';
import 'package:food_app/feature/auth/login_and_register_view/presentation/view/widgets/custom_button.dart';
import 'package:food_app/feature/home/data/models/food_results.dart';
import 'package:food_app/feature/home/presentation/view/widgets/counter.dart';
import 'package:food_app/feature/home/presentation/view/widgets/custom_Details_time.dart';
import 'package:food_app/feature/home/presentation/view/widgets/custom_details_data_row.dart';
import 'package:food_app/feature/home/presentation/view/widgets/custom_details_description.dart';
import 'package:food_app/feature/home/presentation/view/widgets/custom_details_image.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key, required this.food});
  final FoodResults food;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomDetailsImage(food: food),
          ),
          const SizedBox(height: 40),
          CustomDetailsDataRow(food: food),
          CustomDetailsDescription(food: food),
          const SizedBox(height: 20),
          CustomDetailsTime(food: food),
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
