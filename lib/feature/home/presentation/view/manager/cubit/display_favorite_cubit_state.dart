part of 'display_favorite_cubit_cubit.dart';

sealed class DisplayFavoriteCubitState extends Equatable {
  const DisplayFavoriteCubitState();

  @override
  List<Object> get props => [];
}

final class DisplayFavoriteCubitInitial extends DisplayFavoriteCubitState {}

final class DisplayFavoriteSuccess extends DisplayFavoriteCubitState {
  final List<FavoriteModel> favList;

  const DisplayFavoriteSuccess({required this.favList});

  @override
  List<Object> get props => [favList];
}

final class DisplayFavoriteLoading extends DisplayFavoriteCubitState {}
