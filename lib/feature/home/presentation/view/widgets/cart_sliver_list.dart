import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/utils/styles.dart';
import 'package:food_app/feature/home/presentation/view/manager/display_cart/display_cart_cubit.dart';
import 'package:food_app/feature/home/presentation/view/widgets/cart_item.dart';

class CartItemList extends StatefulWidget {
  const CartItemList({super.key});

  @override
  State<CartItemList> createState() => _CartItemListState();
}

class _CartItemListState extends State<CartItemList> {
  @override
  void initState() {
    BlocProvider.of<DisplayCartCubit>(context).displayCart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DisplayCartCubit, DisplayCartState>(
      builder: (context, state) {
        if (state is DisplayCartSuccess) {
          if (state.cartList.isEmpty) {
            return SliverToBoxAdapter(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: Text(
                    'No Products!',
                    style: Styles.textMedium15.copyWith(color: Colors.grey),
                  ),
                ),
              ),
            );
          }
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: state.cartList.length,
              (context, index) {
                return CartItem(cart: state.cartList[index]);
              },
            ),
          );
        } else {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
