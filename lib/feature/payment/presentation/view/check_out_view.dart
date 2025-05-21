import 'package:flutter/material.dart';
import 'package:food_app/feature/payment/presentation/view/widget/check_out_view_body.dart';
import 'package:food_app/feature/payment/presentation/view/widget/custom_app_bar.dart';

class CheckOutView extends StatelessWidget {
  const CheckOutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBarCart(title: 'My Cart', context: context),
      body: const CheckOutViewBody(),
    );
  }
}
