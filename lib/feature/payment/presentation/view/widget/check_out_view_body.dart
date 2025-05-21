import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/constant/box.dart';
import 'package:food_app/core/utils/app_images.dart';
import 'package:food_app/feature/home/data/models/cart_model.dart';
import 'package:food_app/feature/home/presentation/view/manager/cart_cubit/cart_cubit.dart';
import 'package:food_app/feature/payment/data/repo/payment_repo_impl.dart';
import 'package:food_app/feature/payment/presentation/manager/cubit/payment_cubit.dart';
import 'package:food_app/feature/payment/presentation/view/widget/custom_bottom_sheet.dart';
import 'package:food_app/feature/payment/presentation/view/widget/custom_divider.dart';
import 'package:food_app/feature/payment/presentation/view/widget/custom_elevated_button.dart';
import 'package:food_app/feature/payment/presentation/view/widget/custom_item_info.dart';
import 'package:food_app/feature/payment/presentation/view/widget/custom_price.dart';
import 'package:hive/hive.dart';

class CheckOutViewBody extends StatelessWidget {
  const CheckOutViewBody({super.key});

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
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              Expanded(child: Image.asset(Assets.imagesCart2)),
              CustomItemInfo(
                subTitle: '\$ ${totalPrice.toStringAsFixed(2)}',
                title: 'Order total',
              ),
              const SizedBox(height: 4),
              const CustomItemInfo(subTitle: r'$ 0', title: 'Discount'),
              const SizedBox(height: 4),
              const CustomItemInfo(subTitle: '', title: 'Item Shipping'),
              const CustomDivider(),
              CustomPrice(totalPrice: totalPrice),
              const SizedBox(height: 20),
              CustomElevatedButton(
                title: 'Complete Payment',
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return BlocProvider(
                        create: (context) => PaymentCubit(PaymentRepoImpl()),
                        child: CustomModalBottomSheet(
                          totalPrice: totalPrice,
                          count: count,
                        ),
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 60),
            ],
          ),
        );
      },
    );
  }
}
