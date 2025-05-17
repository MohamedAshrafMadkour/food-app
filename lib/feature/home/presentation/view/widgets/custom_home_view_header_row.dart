import 'package:flutter/material.dart';
import 'package:food_app/core/utils/styles.dart';
import 'package:food_app/core/widget/custom_icon.dart';

class CustomHomeViewHeaderRow extends StatelessWidget {
  const CustomHomeViewHeaderRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text('Foodienator', style: Styles.textSemiBold22),
        SizedBox(width: 4),
        CustomIcon(icon: Icons.arrow_drop_down),
      ],
    );
  }
}
