import 'package:flutter/material.dart';
import 'package:food_app/core/utils/app_images.dart';
import 'package:food_app/feature/payment/presentation/view/widget/custom_card_animated_container.dart';

class CustomCardList extends StatefulWidget {
  const CustomCardList({super.key, required this.updatePaymentMethod});
  final Function({required int index}) updatePaymentMethod;
  @override
  State<CustomCardList> createState() => _CustomCardListState();
}

class _CustomCardListState extends State<CustomCardList> {
  List<String> images = const [Assets.imagesCard, Assets.imagesPay];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(2, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: InkWell(
            onTap: () {
              setState(() {
                currentIndex = index;
                widget.updatePaymentMethod(index: currentIndex);
              });
            },
            child: CustomCardAnimatedContainer(
              isActive: currentIndex == index,
              image: images[index],
            ),
          ),
        );
      }),
    );
  }
}
