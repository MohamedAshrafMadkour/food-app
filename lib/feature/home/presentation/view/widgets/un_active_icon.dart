import 'package:flutter/material.dart';
import 'package:food_app/core/utils/colors.dart';

class UnActiveAndActiveIcon extends StatelessWidget {
  const UnActiveAndActiveIcon({
    super.key,
    required this.isActive,
    required this.icon,
    this.onPressed,
  });
  final bool isActive;
  final IconData icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color:
                isActive
                    ? AppColors.activeIconColor
                    : AppColors.unActiveIconColor,
            width: 3,
          ),
        ),
      ),
      child: FittedBox(
        fit: BoxFit.fill,
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            size: 40,
            color:
                isActive
                    ? AppColors.activeIconColor
                    : AppColors.unActiveIconColor,
          ),
        ),
      ),
    );
  }
}
