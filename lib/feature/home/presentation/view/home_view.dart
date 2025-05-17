import 'package:flutter/material.dart';
import 'package:food_app/core/widget/custom_icon.dart';
import 'package:food_app/feature/home/presentation/view/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: const CustomIcon(icon: Icons.sort),
        actions: const [CustomIcon(icon: Icons.search)],
      ),
      body: const HomeViewBody(),
    );
  }
}
