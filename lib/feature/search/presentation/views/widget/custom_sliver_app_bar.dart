import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app/core/widget/custom_icon.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      leading: CustomIcon(icon: Icons.sort, color: Color(0xffFFFFFF), size: 36),
      actions: [
        CustomIcon(
          icon: FontAwesomeIcons.cartShopping,
          color: Color(0xffFFFFFF),
        ),
      ],
    );
  }
}
