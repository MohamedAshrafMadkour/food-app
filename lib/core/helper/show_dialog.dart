import 'package:flutter/material.dart';
import 'package:food_app/core/constant/color_constant.dart';
import 'package:food_app/core/utils/styles.dart';
import 'package:food_app/core/widget/custom_end_icon.dart';

Future<dynamic> customDialog(
  BuildContext context, {
  required List<String> meals,
  Function()? onTap1,
  Function()? onTap2,
  Function()? onTap3,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Choose the meal'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text(
                meals[0],
                style: Styles.textRegular25.copyWith(color: kAuthColor),
              ),
              onTap: onTap1,
            ),
            ListTile(
              title: Text(
                meals[1],
                style: Styles.textRegular25.copyWith(color: kAuthColor),
              ),
              onTap: onTap2,
            ),
            ListTile(
              title: Text(
                meals[2],
                style: Styles.textRegular25.copyWith(color: kAuthColor),
              ),
              onTap: onTap3,
            ),
            const CustomBorderIcon(icon: Icons.lock),
          ],
        ),
      );
    },
  );
}
