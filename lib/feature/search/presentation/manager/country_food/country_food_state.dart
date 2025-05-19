part of 'country_food_cubit.dart';

sealed class CountryFoodState extends Equatable {
  const CountryFoodState();

  @override
  List<Object> get props => [];
}

final class CountryFoodInitial extends CountryFoodState {}

final class CountryFoodLoading extends CountryFoodState {}

final class CountryFoodSuccess extends CountryFoodState {
  final List<MealsFood> country;

  const CountryFoodSuccess({required this.country});
}

final class CountryFoodFailure extends CountryFoodState {
  final String error;

  const CountryFoodFailure({required this.error});
}
