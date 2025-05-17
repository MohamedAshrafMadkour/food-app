import 'package:flutter/material.dart';
import 'package:food_app/core/utils/colors.dart';
import 'package:go_router/go_router.dart';

class CustomBorderIcon extends StatelessWidget {
  const CustomBorderIcon({super.key, required this.icon, this.color});
  final IconData icon;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: color ?? AppColors.activeIconColor, width: 3),
        ),
      ),
      child: FittedBox(
        fit: BoxFit.fill,
        child: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: Icon(icon, size: 30, color: color ?? AppColors.activeIconColor),
        ),
      ),
    );
  }
}
