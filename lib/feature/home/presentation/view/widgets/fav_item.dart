import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app/core/utils/styles.dart';
import 'package:food_app/core/widget/custom_icon.dart';
import 'package:food_app/feature/home/data/models/favorite_model.dart';
import 'package:food_app/feature/home/presentation/view/manager/cubit/display_favorite_cubit_cubit.dart';

class FavItem extends StatelessWidget {
  const FavItem({super.key, required this.fav});
  final FavoriteModel fav;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(255, 255, 255, 0.5),
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 10,
          ),
          title: Text(fav.name, style: Styles.textRegular25),
          subtitle: Text(
            '${fav.price} \$',
            style: Styles.textRegular25.copyWith(fontSize: 18),
          ),
          trailing: CustomIcon(
            icon: FontAwesomeIcons.trash,
            size: 28,
            color: Colors.redAccent,
            onPressed: () {
              fav.delete();
              BlocProvider.of<DisplayFavoriteCubitCubit>(context).displayFav();
            },
          ),
        ),
      ),
    );
  }
}
