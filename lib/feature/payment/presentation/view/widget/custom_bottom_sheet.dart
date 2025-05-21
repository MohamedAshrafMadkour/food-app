import 'package:flutter/material.dart';
import 'package:food_app/feature/payment/presentation/view/widget/custom_card_list.dart';
import 'package:food_app/feature/payment/presentation/view/widget/custom_consumer_button.dart';

class CustomModalBottomSheet extends StatefulWidget {
  const CustomModalBottomSheet({
    super.key,
    required this.totalPrice,
    required this.count,
  });
  final double totalPrice;
  final int count;

  @override
  State<CustomModalBottomSheet> createState() => _CustomModalBottomSheetState();
}

class _CustomModalBottomSheetState extends State<CustomModalBottomSheet> {
  bool isPaypal = false;
  updatePaymentMethod({required int index}) {
    if (index == 0) {
      isPaypal = false;
    } else {
      isPaypal = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16),
          CustomCardList(updatePaymentMethod: updatePaymentMethod),
          const SizedBox(height: 32),
          CustomConsumerButton(
            count: widget.count,
            isPaypal: isPaypal,
            totalPrice: widget.totalPrice,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
