import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_app/core/constant/box.dart';
import 'package:food_app/feature/home/data/models/favorite_model.dart';
import 'package:hive/hive.dart';

part 'display_favorite_cubit_state.dart';

class DisplayFavoriteCubitCubit extends Cubit<DisplayFavoriteCubitState> {
  DisplayFavoriteCubitCubit() : super(DisplayFavoriteCubitInitial());

  displayFav() {
    final favList = Hive.box<FavoriteModel>(kFavBox).values.toList();
    emit(DisplayFavoriteSuccess(favList: favList));
  }

  delete() async {
    var fav = Hive.box<FavoriteModel>(kFavBox);
    await fav.clear();
    displayFav();
  }
}
