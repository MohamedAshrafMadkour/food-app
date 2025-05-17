import 'package:flutter/material.dart';
import 'package:food_app/core/utils/styles.dart';
import 'package:food_app/feature/home/presentation/view/widgets/icon_list_view.dart';

class CustomHomeViewBodyHeader extends StatelessWidget {
  const CustomHomeViewBodyHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Choose your preferred meal', style: Styles.textSemiBold13),
        SizedBox(height: 30),
        IconListView(),
        SizedBox(height: 20),
      ],
    );
  }
}
