import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_app/core/constant/box.dart';
import 'package:food_app/feature/home/data/models/cart_model.dart';
import 'package:hive/hive.dart';

part 'display_cart_state.dart';

class DisplayCartCubit extends Cubit<DisplayCartState> {
  DisplayCartCubit() : super(DisplayCartInitial());

  displayCart() {
    final cartList = Hive.box<CartModel>(kCartBox).values.toList();
    emit(DisplayCartSuccess(cartList));
  }
}
