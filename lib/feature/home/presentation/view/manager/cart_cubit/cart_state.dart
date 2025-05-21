part of 'cart_cubit.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartSuccess extends CartState {}

final class CartFailure extends CartState {
  final String error;

  const CartFailure({required this.error});
}

class CartCountUpdated extends CartState {
  final int count;
  final double totalPrice;
  const CartCountUpdated({required this.count, required this.totalPrice});
}
