import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app/core/utils/styles.dart';
import 'package:food_app/core/widget/custom_icon.dart';
import 'package:food_app/feature/home/data/models/cart_model.dart';
import 'package:food_app/feature/home/presentation/view/manager/display_cart/display_cart_cubit.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cart});
  final CartModel cart;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(255, 255, 255, 0.5),
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 10,
          ),
          title: Text(cart.name, style: Styles.textRegular25),
          subtitle: Text(
            '${cart.price} \$',
            style: Styles.textRegular25.copyWith(fontSize: 18),
          ),
          trailing: CustomIcon(
            icon: FontAwesomeIcons.trash,
            size: 28,
            color: Colors.redAccent,
            onPressed: () {
              cart.delete();
              BlocProvider.of<DisplayCartCubit>(context).displayCart();
            },
          ),
        ),
      ),
    );
  }
}
