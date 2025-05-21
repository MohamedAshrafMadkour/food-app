import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/feature/auth/login_and_register_view/presentation/view/widgets/custom_button.dart';
import 'package:food_app/feature/home/presentation/view/manager/cubit/display_favorite_cubit_cubit.dart';
import 'package:food_app/feature/home/presentation/view/widgets/fav_item_list.dart';

class FavoriteContent extends StatelessWidget {
  const FavoriteContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(child: CustomScrollView(slivers: [FavItemList()])),
        const SizedBox(height: 20),

        BlocBuilder<DisplayFavoriteCubitCubit, DisplayFavoriteCubitState>(
          builder: (context, state) {
            if (state is DisplayFavoriteSuccess) {
              if (state.favList.isNotEmpty) {
                return CustomButton(
                  text: 'Delete All',
                  onPressed: () {
                    BlocProvider.of<DisplayFavoriteCubitCubit>(
                      context,
                    ).delete();
                  },
                );
              } else {
                return const AbsorbPointer(
                  child: CustomButton(text: 'No Thing To delete'),
                );
              }
            } else {
              return const SizedBox();
            }
          },
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * .08),
      ],
    );
  }
}
