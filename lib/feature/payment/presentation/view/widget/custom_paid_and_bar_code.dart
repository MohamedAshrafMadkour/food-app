import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app/core/utils/styles.dart';

class CustomPaidAndBarCode extends StatelessWidget {
  const CustomPaidAndBarCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(FontAwesomeIcons.barcode, size: 64),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: const BorderSide(width: 1.5, color: Color(0xff34A853)),
            ),
          ),
          child: Text(
            'PAID',
            style: Styles.textSemiBold24.copyWith(
              color: const Color(0xff34A853),
            ),
          ),
        ),
      ],
    );
  }
}
