import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/constant/box.dart';
import 'package:food_app/feature/home/data/models/cart_model.dart';
import 'package:food_app/feature/home/data/models/food_results.dart';
import 'package:hive/hive.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  void addProduct({
    required FoodResults food,
    required BuildContext context,
  }) async {
    var cart = CartModel(
      name: food.title!,
      price: food.pricePerServing.toString(),
    );
    emit(CartLoading());
    try {
      var cartBox = Hive.box<CartModel>(kCartBox);
      await cartBox.add(cart);

      double totalPrice = 0;
      for (var item in cartBox.values) {
        totalPrice += double.tryParse(item.price) ?? 0;
      }
      int count = cartBox.length;
      emit(CartCountUpdated(count: count, totalPrice: totalPrice));
      emit(CartSuccess());
    } catch (e) {
      emit(CartFailure(error: e.toString()));
    }
  }
}
