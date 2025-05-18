import 'package:flutter/material.dart';
import 'package:food_app/core/utils/navigation.dart';
import 'package:food_app/core/widget/custom_icon.dart';
import 'package:food_app/feature/home/presentation/view/widgets/home_view_body.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: const CustomIcon(icon: Icons.sort),
        actions: [
          CustomIcon(
            icon: Icons.search,
            onPressed: () {
              GoRouter.of(context).push(RouterNavigation.kSearchView);
            },
          ),
        ],
      ),
      body: const HomeViewBody(),
    );
  }
}
