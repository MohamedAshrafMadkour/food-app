import 'package:flutter/material.dart';
import 'package:food_app/feature/home/presentation/view/widgets/custom_sell_button.dart';
import 'package:food_app/feature/home/presentation/view/widgets/custom_sliver_grid.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Expanded(child: CustomScrollView(slivers: [CustomSliverGrid()])),
        SizedBox(height: 20),
        CustomSellButton(),
        SizedBox(height: 20),
      ],
    );
  }
}
