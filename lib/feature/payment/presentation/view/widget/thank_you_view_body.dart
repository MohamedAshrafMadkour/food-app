import 'package:flutter/material.dart';
import 'package:food_app/feature/payment/presentation/view/widget/custom_check_circle.dart';
import 'package:food_app/feature/payment/presentation/view/widget/custom_dash_line.dart';
import 'package:food_app/feature/payment/presentation/view/widget/custom_thanks_container.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key, required this.totalPrice});
  final double totalPrice;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomThanksContainer(totalPrice: totalPrice),
        ),
        Positioned(
          left: -20,
          bottom: MediaQuery.sizeOf(context).height * .2,
          child: const CircleAvatar(radius: 40, backgroundColor: Colors.white),
        ),
        Positioned(
          right: -20,
          bottom: MediaQuery.sizeOf(context).height * .2,
          child: const CircleAvatar(radius: 40, backgroundColor: Colors.white),
        ),
        Positioned(
          right: 58,
          left: 58,
          bottom: MediaQuery.sizeOf(context).height * .22 + 20,
          child: const CustomDashLine(),
        ),
        const Positioned(
          right: 0,
          left: 0,
          top: -30,
          child: CustomCheckCircle(),
        ),
      ],
    );
  }
}
