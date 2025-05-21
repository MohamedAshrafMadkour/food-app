import 'package:flutter/material.dart';
import 'package:food_app/feature/home/presentation/view/widgets/cart_content.dart';
import 'package:food_app/feature/home/presentation/view/widgets/custom_home_view_body_header.dart';
import 'package:food_app/feature/home/presentation/view/widgets/custom_home_view_header_row.dart';
import 'package:food_app/feature/home/presentation/view/widgets/favourite_content.dart';
import 'package:food_app/feature/home/presentation/view/widgets/home_content.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  int currentIndex = 0;
  Widget buildCurrentPage(int index) {
    switch (index) {
      case 0:
        return const HomeContent();
      case 1:
        return const FavoriteContent();

      case 2:
        return const CartContent();
      default:
        return const Center(child: Text('Page not found'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const CustomHomeViewHeaderRow(),
            CustomHomeViewBodyHeader(
              onIconSelected: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              currentIndex: currentIndex,
            ),
            Expanded(child: buildCurrentPage(currentIndex)),
          ],
        ),
      ),
    );
  }
}
