import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_app/feature/search/data/model/meals_food.dart';
import 'package:food_app/feature/search/data/repo/search_repo.dart';

part 'food_type_state.dart';

class FoodTypeCubit extends Cubit<FoodTypeState> {
  FoodTypeCubit(this.searchRepo) : super(FoodTypeInitial());
  final SearchRepo searchRepo;
  Future getFoodTypeCubitMethod({required String type}) async {
    emit(FoodTypeLoading());
    var data = await searchRepo.getFoodType(type: type);
    log(data.toString());
    data.fold((failure) => emit(FoodTypeFailure(error: failure.errorMessage)), (
      success,
    ) {
      emit(FoodTypeSuccess(type: success));
    });
  }
}
