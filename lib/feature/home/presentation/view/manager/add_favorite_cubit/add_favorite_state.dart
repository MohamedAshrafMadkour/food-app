part of 'add_favorite_cubit.dart';

sealed class AddFavoriteState extends Equatable {
  const AddFavoriteState();

  @override
  List<Object> get props => [];
}

final class AddFavoriteInitial extends AddFavoriteState {}

final class AddFavoriteSuccess extends AddFavoriteState {}

final class AddFavoriteLoading extends AddFavoriteState {}

final class AddFavoriteFailure extends AddFavoriteState {
  final String error;

  const AddFavoriteFailure({required this.error});
}
