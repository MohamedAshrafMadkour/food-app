import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/utils/styles.dart';
import 'package:food_app/feature/home/presentation/view/manager/cubit/display_favorite_cubit_cubit.dart';
import 'package:food_app/feature/home/presentation/view/widgets/fav_item.dart';

class FavItemList extends StatefulWidget {
  const FavItemList({super.key});

  @override
  State<FavItemList> createState() => _FavItemListState();
}

class _FavItemListState extends State<FavItemList> {
  @override
  void initState() {
    BlocProvider.of<DisplayFavoriteCubitCubit>(context).displayFav();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DisplayFavoriteCubitCubit, DisplayFavoriteCubitState>(
      builder: (context, state) {
        if (state is DisplayFavoriteSuccess) {
          if (state.favList.isEmpty) {
            return SliverToBoxAdapter(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: Text(
                    'No Products!',
                    style: Styles.textMedium15.copyWith(color: Colors.grey),
                  ),
                ),
              ),
            );
          }
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: state.favList.length,
              (context, index) {
                return FavItem(fav: state.favList[index]);
              },
            ),
          );
        } else {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
