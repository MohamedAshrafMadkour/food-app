import 'package:flutter/material.dart';
import 'package:food_app/core/constant/color_constant.dart';
import 'package:food_app/core/utils/styles.dart';
import 'package:food_app/feature/home/data/models/food_results.dart';

class CustomDetailsPriceContainer extends StatelessWidget {
  const CustomDetailsPriceContainer({super.key, required this.food});
  final FoodResults food;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * .3,
      height: MediaQuery.sizeOf(context).height * .07,
      decoration: const ShapeDecoration(
        color: kAuthColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(32),
            topLeft: Radius.circular(32),
          ),
        ),
      ),
      child: Center(
        child: Text(
          r'$'
          '${food.pricePerServing}',
          style: Styles.textSemiBold15.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
