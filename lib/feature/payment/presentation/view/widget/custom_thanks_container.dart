import 'package:flutter/material.dart';
import 'package:food_app/feature/payment/presentation/view/widget/custom_thanks_data.dart';

class CustomThanksContainer extends StatelessWidget {
  const CustomThanksContainer({super.key, required this.totalPrice});
  final double totalPrice;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      decoration: ShapeDecoration(
        color: const Color(0xffEDEDED),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: CustomThanksData(totalPrice: totalPrice),
      ),
    );
  }
}
