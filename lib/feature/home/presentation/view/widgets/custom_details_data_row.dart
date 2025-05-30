import 'package:flutter/material.dart';
import 'package:food_app/core/utils/styles.dart';
import 'package:food_app/feature/home/data/models/food_results.dart';
import 'package:food_app/feature/home/presentation/view/widgets/custom_details_price_conatiner.dart';

class CustomDetailsDataRow extends StatelessWidget {
  const CustomDetailsDataRow({super.key, required this.food});
  final FoodResults food;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width * .6,
            child: Text(
              food.title ?? " ",
              style: Styles.textBold32.copyWith(color: Colors.black),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        CustomFoodItemPriceContainer(food: food),
      ],
    );
  }
}
