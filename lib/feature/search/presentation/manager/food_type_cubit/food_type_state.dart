part of 'food_type_cubit.dart';

sealed class FoodTypeState extends Equatable {
  const FoodTypeState();

  @override
  List<Object> get props => [];
}

final class FoodTypeInitial extends FoodTypeState {}

final class FoodTypeLoading extends FoodTypeState {}

final class FoodTypeSuccess extends FoodTypeState {
  final List<MealsFood> type;

  const FoodTypeSuccess({required this.type});
}

final class FoodTypeFailure extends FoodTypeState {
  final String error;

  const FoodTypeFailure({required this.error});
}
