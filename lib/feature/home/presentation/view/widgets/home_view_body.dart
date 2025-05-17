import 'package:flutter/material.dart';
import 'package:food_app/core/constant/color_constant.dart';
import 'package:food_app/core/utils/styles.dart';
import 'package:food_app/feature/home/presentation/view/widgets/custom_home_view_body_header.dart';
import 'package:food_app/feature/home/presentation/view/widgets/custom_home_view_header_row.dart';
import 'package:food_app/feature/home/presentation/view/widgets/custom_sell_button.dart';
import 'package:food_app/feature/home/presentation/view/widgets/custom_sliver_grid..dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(child: CustomHomeViewHeaderRow()),
                  SliverToBoxAdapter(child: CustomHomeViewBodyHeader()),
                  CustomSliverGrid(),
                ],
              ),
            ),
            SizedBox(height: 20),
            CustomSellButton(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
