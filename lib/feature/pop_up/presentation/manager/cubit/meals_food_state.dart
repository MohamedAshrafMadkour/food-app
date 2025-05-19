part of 'meals_food_cubit.dart';

sealed class MealsFoodState extends Equatable {
  const MealsFoodState();

  @override
  List<Object> get props => [];
}

final class MealsFoodInitial extends MealsFoodState {}

final class MealsFoodLoading extends MealsFoodState {}

final class MealsFoodSuccess extends MealsFoodState {
  final List<TastyApiModel> food;

  const MealsFoodSuccess(this.food);
}

final class MealsFoodFailure extends MealsFoodState {
  final String error;

  const MealsFoodFailure(this.error);
}
