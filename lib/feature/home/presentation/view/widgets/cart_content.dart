import 'package:flutter/material.dart';
import 'package:food_app/core/utils/navigation.dart';
import 'package:food_app/feature/auth/login_and_register_view/presentation/view/widgets/custom_button.dart';
import 'package:food_app/feature/home/presentation/view/widgets/cart_sliver_list.dart';
import 'package:go_router/go_router.dart';

class CartContent extends StatelessWidget {
  const CartContent({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(child: CustomScrollView(slivers: [CartItemList()])),
        const SizedBox(height: 20),
        CustomButton(
          text: 'CheckOut',
          onPressed: () {
            GoRouter.of(context).push(RouterNavigation.kCheckOutView);
          },
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * .08),
      ],
    );
  }
}
