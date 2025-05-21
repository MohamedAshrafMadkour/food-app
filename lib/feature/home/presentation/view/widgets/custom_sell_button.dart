import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/constant/box.dart';
import 'package:food_app/core/constant/color_constant.dart';
import 'package:food_app/core/utils/styles.dart';
import 'package:food_app/feature/home/data/models/cart_model.dart';
import 'package:food_app/feature/home/presentation/view/manager/cart_cubit/cart_cubit.dart';
import 'package:hive/hive.dart';

class CustomSellButton extends StatelessWidget {
  const CustomSellButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        double totalPrice = 0;
        int count = 0;
        if (state is CartCountUpdated) {
          count = state.count;
          totalPrice = state.totalPrice;
        } else {
          var cartBox = Hive.box<CartModel>(kCartBox);
          count = cartBox.length;
          totalPrice = 0;
          for (var item in cartBox.values) {
            totalPrice += double.tryParse(item.price) ?? 0;
          }
        }
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            minimumSize: const Size(double.infinity, 65),
            backgroundColor: kAuthColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(64),
                bottomRight: Radius.circular(64),
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
          ),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('$count Items', style: Styles.textSemiBold14),
              Text(
                '\$ ${totalPrice.toStringAsFixed(2)}',
                style: Styles.textSemiBold14,
              ),
            ],
          ),
        );
      },
    );
  }
}
