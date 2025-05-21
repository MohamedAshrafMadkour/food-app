import 'package:flutter/material.dart';
import 'package:food_app/core/utils/app_images.dart';
import 'package:food_app/core/utils/navigation.dart';
import 'package:food_app/feature/payment/presentation/view/widget/thank_you_view_body.dart';
import 'package:go_router/go_router.dart';
import 'package:svg_flutter/svg.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key, required this.totalPrice});
  final double totalPrice;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () {
            GoRouter.of(context).pushReplacement(RouterNavigation.kHomeView);
          },
          child: Center(child: SvgPicture.asset(Assets.imagesArrow)),
        ),
      ),
      body: Transform.translate(
        offset: const Offset(0, -22),
        child: ThankYouViewBody(totalPrice: totalPrice),
      ),
    );
  }
}
