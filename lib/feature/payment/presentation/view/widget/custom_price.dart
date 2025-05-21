import 'package:flutter/material.dart';
import 'package:food_app/core/utils/styles.dart';

class CustomPrice extends StatelessWidget {
  const CustomPrice({super.key, required this.totalPrice});
  final double totalPrice;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Total', style: Styles.textSemiBold24),
        Text(
          r'$'
          '$totalPrice',
          style: Styles.textSemiBold24,
        ),
      ],
    );
  }
}
