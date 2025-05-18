import 'package:flutter/material.dart';
import 'package:food_app/core/utils/styles.dart';
import 'package:food_app/core/widget/custom_icon.dart';
import 'package:go_router/go_router.dart';

AppBar customAppBar(BuildContext context, {required String meal}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    leading: CustomIcon(
      icon: Icons.arrow_back_ios,
      size: 24,
      color: Colors.white,
      onPressed: () {
        GoRouter.of(context).pop();
      },
    ),
    centerTitle: true,
    elevation: 0,
    scrolledUnderElevation: 0,
    title: Text(meal, style: Styles.textBold30.copyWith(color: Colors.white)),
  );
}
