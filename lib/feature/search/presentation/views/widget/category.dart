import 'package:flutter/material.dart';
import 'package:food_app/core/utils/styles.dart';

class Category extends StatelessWidget {
  const Category({
    super.key,
    required this.isActive,
    this.onTap,
    required this.meal,
  });
  final bool isActive;
  final Function()? onTap;
  final String meal;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        meal,
        style: Styles.textRegular18.copyWith(
          fontWeight: FontWeight.w500,
          color: isActive ? Colors.white : Colors.grey[400],
        ),
      ),
    );
  }
}
