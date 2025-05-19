import 'package:flutter/material.dart';
import 'package:food_app/core/utils/styles.dart';
import 'package:food_app/feature/pop_up/data/models/tasty_api_model/tasty_api_model.dart';

class CustomMealDetailsDataRow extends StatelessWidget {
  const CustomMealDetailsDataRow({super.key, required this.food});
  final TastyApiModel food;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width * .6,
        child: Text(
          food.name ?? " ",
          style: Styles.textBold32.copyWith(color: Colors.black),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
