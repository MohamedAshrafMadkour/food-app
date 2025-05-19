import 'package:flutter/material.dart';
import 'package:food_app/core/utils/styles.dart';
import 'package:food_app/core/widget/custom_end_icon.dart';
import 'package:food_app/feature/pop_up/data/models/tasty_api_model/tasty_api_model.dart';

class CustomMealDetailsTime extends StatelessWidget {
  const CustomMealDetailsTime({super.key, required this.food});
  final TastyApiModel food;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomBorderIcon(
            icon: Icons.schedule,
            color: Color(0xffC4C4C4),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Ready Time', style: Styles.textSemiBold16),
              Text(food.createdAt.toString(), style: Styles.textRegular14),
            ],
          ),
        ],
      ),
    );
  }
}
