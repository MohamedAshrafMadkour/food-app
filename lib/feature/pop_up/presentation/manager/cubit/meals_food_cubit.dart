import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_app/feature/pop_up/data/models/tasty_api_model/tasty_api_model.dart';
import 'package:food_app/feature/pop_up/data/repo/pop_up_repo.dart';
part 'meals_food_state.dart';

class MealsFoodCubit extends Cubit<MealsFoodState> {
  MealsFoodCubit(this.popUpRepo) : super(MealsFoodInitial());
  final PopUpRepo popUpRepo;
  Future getMealsMethod({required String meals}) async {
    emit(MealsFoodLoading());

    var data = await popUpRepo.getMeals(meals: meals);
    log(data.toString());
    data.fold((failure) => emit(MealsFoodFailure(failure.errorMessage)), (
      success,
    ) {
      emit(MealsFoodSuccess(success));
    });
  }
}
