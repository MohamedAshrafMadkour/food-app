part of 'display_cart_cubit.dart';

sealed class DisplayCartState extends Equatable {
  const DisplayCartState();

  @override
  List<Object> get props => [];
}

final class DisplayCartInitial extends DisplayCartState {}

final class DisplayCartSuccess extends DisplayCartState {
  final List<CartModel> cartList;

  const DisplayCartSuccess(this.cartList);

  @override
  List<Object> get props => [cartList];
}
