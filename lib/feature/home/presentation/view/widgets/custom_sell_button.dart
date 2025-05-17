import 'package:flutter/material.dart';
import 'package:food_app/core/constant/color_constant.dart';
import 'package:food_app/core/utils/styles.dart';

class CustomSellButton extends StatelessWidget {
  const CustomSellButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        minimumSize: const Size(double.infinity, 65),
        backgroundColor: kAuthColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(64),
            bottomRight: Radius.circular(64),
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
      ),
      onPressed: () {},
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('3 Items', style: Styles.textSemiBold14),
          Text(r'$14200.00', style: Styles.textSemiBold14),
        ],
      ),
    );
  }
}
