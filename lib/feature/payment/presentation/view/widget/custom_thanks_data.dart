import 'package:flutter/material.dart';
import 'package:food_app/core/utils/styles.dart';
import 'package:food_app/feature/payment/presentation/view/widget/custom_logo_and_card_container.dart';
import 'package:food_app/feature/payment/presentation/view/widget/custom_paid_and_bar_code.dart';
import 'package:food_app/feature/payment/presentation/view/widget/custom_price.dart';
import 'package:food_app/feature/payment/presentation/view/widget/thanks_item_info.dart';

class CustomThanksData extends StatelessWidget {
  const CustomThanksData({super.key, required this.totalPrice});
  final double totalPrice;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 90),
        Text(
          'Thank you!',
          style: Styles.textRegular23.copyWith(color: Colors.black),
        ),
        Text(
          'Your transaction was successful',
          style: Styles.textRegular23.copyWith(color: Colors.black),
        ),
        const SizedBox(height: 40),
        const ThanksItemInfo(title: 'Date', subTitle: '01/24/2023'),
        const SizedBox(height: 6),
        const ThanksItemInfo(title: 'Time', subTitle: '10:15 AM'),
        const SizedBox(height: 6),
        const ThanksItemInfo(title: 'To', subTitle: 'Ahmed'),
        const Divider(thickness: 2, height: 60),
        CustomPrice(totalPrice: totalPrice),
        const SizedBox(height: 60),
        const CustomLogoAndCardContainer(),
        const Spacer(),
        const CustomPaidAndBarCode(),
        SizedBox(
          height: ((MediaQuery.sizeOf(context).height * .18 + 20) / 2) - 20,
        ),
      ],
    );
  }
}
