import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_app/feature/search/data/model/meals_food.dart';
import 'package:food_app/feature/search/data/repo/search_repo.dart';
part 'country_food_state.dart';

class CountryFoodCubit extends Cubit<CountryFoodState> {
  CountryFoodCubit(this.searchRepo) : super(CountryFoodInitial());
  final SearchRepo searchRepo;
  Future getCountryFoodCubitMethod({required String country}) async {
    emit(CountryFoodLoading());
    var data = await searchRepo.getCountryFood(country: country);
    log(data.toString());
    data.fold(
      (failure) => emit(CountryFoodFailure(error: failure.errorMessage)),
      (success) {
        emit(CountryFoodSuccess(country: success));
      },
    );
  }

  remove() {
    emit(CountryFoodInitial());
  }
}
