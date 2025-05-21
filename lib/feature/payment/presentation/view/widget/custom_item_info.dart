import 'package:flutter/material.dart';
import 'package:food_app/core/utils/styles.dart';

class CustomItemInfo extends StatelessWidget {
  const CustomItemInfo({
    super.key,
    required this.title,
    required this.subTitle,
  });
  final String title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Styles.textRegular18),
        Text('$subTitle', style: Styles.textRegular18),
      ],
    );
  }
}
