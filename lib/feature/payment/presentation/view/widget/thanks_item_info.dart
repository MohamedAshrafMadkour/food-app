import 'package:flutter/material.dart';
import 'package:food_app/core/utils/styles.dart';

class ThanksItemInfo extends StatelessWidget {
  const ThanksItemInfo({
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
        Text(subTitle, style: Styles.textSemiBold16),
      ],
    );
  }
}
