import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_app/feature/home/data/models/food_results.dart';
import 'package:food_app/feature/home/data/repo/home_repo.dart';

part 'main_food_state.dart';

class MainFoodCubit extends Cubit<MainFoodState> {
  MainFoodCubit(this.homeRepo) : super(MainFoodInitial());
  final HomeRepo homeRepo;
  Future getMainFoodCubitMethod() async {
    emit(GetMainFoodLoading());
    var data = await homeRepo.getMainFood();
    log(data.toString());
    data.fold((failure) => emit(GetMainFoodFailure(failure.errorMessage)), (
      success,
    ) {
      emit(GetMainFoodSuccess(success));
    });
  }
}
