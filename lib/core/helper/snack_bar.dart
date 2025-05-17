import 'package:flutter/material.dart';
import 'package:food_app/core/constant/color_constant.dart';

void snakeBarShow(BuildContext context, String textShow) {
  final snackBar = SnackBar(
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.white,
    duration: const Duration(seconds: 3),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    content: Row(
      children: [
        const Icon(Icons.error_outline, color: kAuthColor),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            maxLines: 3,
            textShow,
            style: const TextStyle(
              color: kAuthColor,
              fontWeight: FontWeight.bold,

              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    ),
    action: SnackBarAction(
      label: 'Dismiss',
      textColor: kAuthColor,
      onPressed: () {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      },
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
