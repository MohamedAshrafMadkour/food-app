import 'package:flutter/material.dart';
import 'package:food_app/core/utils/styles.dart';
import 'package:food_app/feature/home/presentation/view/widgets/icon_list_view.dart';

class CustomHomeViewBodyHeader extends StatelessWidget {
  const CustomHomeViewBodyHeader({
    super.key,
    required this.currentIndex,
    required this.onIconSelected,
  });
  final int currentIndex;
  final Function(int) onIconSelected;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Choose your preferred meal', style: Styles.textSemiBold13),
        const SizedBox(height: 30),
        IconListView(
          currentIndex: currentIndex,
          onIconSelected: onIconSelected,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
