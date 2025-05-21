part of 'main_food_cubit.dart';

sealed class MainFoodState extends Equatable {
  const MainFoodState();

  @override
  List<Object> get props => [];
}

final class MainFoodInitial extends MainFoodState {}

final class GetMainFoodLoading extends MainFoodState {}

final class GetMainFoodSuccess extends MainFoodState {
  final List<FoodResults> food;

  const GetMainFoodSuccess(this.food);
}

final class GetMainFoodFailure extends MainFoodState {
  final String error;

  const GetMainFoodFailure(this.error);
}
