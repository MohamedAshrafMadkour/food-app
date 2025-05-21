import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_app/core/constant/box.dart';
import 'package:food_app/feature/home/data/models/favorite_model.dart';
import 'package:food_app/feature/home/data/models/food_results.dart';
import 'package:hive/hive.dart';

part 'add_favorite_state.dart';

class AddFavoriteCubit extends Cubit<AddFavoriteState> {
  AddFavoriteCubit() : super(AddFavoriteInitial());

  void addFavorite({required FoodResults food}) async {
    var model = FavoriteModel(
      name: food.title!,
      price: food.pricePerServing.toString(),
    );
    try {
      var favorite = Hive.box<FavoriteModel>(kFavBox);
      favorite.add(model);
      emit(AddFavoriteSuccess());
    } catch (e) {
      emit(AddFavoriteFailure(error: e.toString()));
    }
  }
}
