import 'package:flutter/material.dart';
import 'package:food_app/feature/home/presentation/view/widgets/counter_icon.dart';

class CustomCounter extends StatefulWidget {
  const CustomCounter({super.key});

  @override
  State<CustomCounter> createState() => _CustomCounterState();
}

class _CustomCounterState extends State<CustomCounter> {
  int numOfProduct = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButtonWidget(
          icon: Icons.remove,
          onPressed: () {
            setState(() {
              if (numOfProduct > 1) {
                numOfProduct--;
              }
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            numOfProduct.toString().padLeft(2, '0'),
            style: TextStyle(fontSize: 20),
          ),
        ),
        IconButtonWidget(
          icon: Icons.add,
          onPressed: () {
            setState(() {
              numOfProduct++;
            });
          },
        ),
      ],
    );
  }
}
