import 'package:flutter/material.dart';
import 'package:food_app/core/constant/lists.dart';
import 'package:food_app/core/helper/show_dialog.dart';
import 'package:food_app/core/utils/navigation.dart';
import 'package:food_app/core/utils/styles.dart';
import 'package:food_app/core/widget/custom_icon.dart';
import 'package:go_router/go_router.dart';

class CustomHomeViewHeaderRow extends StatelessWidget {
  const CustomHomeViewHeaderRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('Main Meals', style: Styles.textSemiBold22),
        const SizedBox(width: 4),
        CustomIcon(
          icon: Icons.arrow_drop_down,
          onPressed: () {
            customDialog(
              context,
              meals: kMainMeals,
              onTap1: () {
                GoRouter.of(context).pop();
                GoRouter.of(context).push(RouterNavigation.kBreakfastView);
              },
              onTap2: () {
                GoRouter.of(context).pop();
                GoRouter.of(context).push(RouterNavigation.kLaunchView);
              },
              onTap3: () {
                GoRouter.of(context).pop();
                GoRouter.of(context).push(RouterNavigation.kDinnerView);
              },
            );
          },
        ),
      ],
    );
  }
}
