import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/helper/snack_bar.dart';
import 'package:food_app/core/widget/custom_icon.dart';
import 'package:food_app/feature/auth/login_and_register_view/presentation/view/widgets/custom_button.dart';
import 'package:food_app/feature/home/data/models/food_results.dart';
import 'package:food_app/feature/home/presentation/view/manager/add_favorite_cubit/add_favorite_cubit.dart';
import 'package:food_app/feature/home/presentation/view/manager/cart_cubit/cart_cubit.dart';
import 'package:food_app/feature/home/presentation/view/manager/cubit/display_favorite_cubit_cubit.dart';
import 'package:food_app/feature/home/presentation/view/manager/display_cart/display_cart_cubit.dart';
import 'package:food_app/feature/home/presentation/view/widgets/counter.dart';
import 'package:food_app/feature/home/presentation/view/widgets/custom_Details_time.dart';
import 'package:food_app/feature/home/presentation/view/widgets/custom_details_data_row.dart';
import 'package:food_app/feature/home/presentation/view/widgets/custom_details_description.dart';
import 'package:food_app/feature/home/presentation/view/widgets/custom_details_image.dart';

class DetailsViewBody extends StatefulWidget {
  const DetailsViewBody({
    super.key,
    required this.food,
    required this.onSumChanged,
  });
  final FoodResults food;
  final void Function(int) onSumChanged;
  @override
  State<DetailsViewBody> createState() => _DetailsViewBodyState();
}

class _DetailsViewBodyState extends State<DetailsViewBody> {
  int sum = 0;

  void increaseSum() {
    setState(() {
      sum++;
    });
    widget.onSumChanged(sum); // ترسل القيمة للخارج
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomDetailsImage(food: widget.food),
          ),
          const SizedBox(height: 40),
          CustomDetailsDataRow(food: widget.food),
          CustomDetailsDescription(food: widget.food),
          const SizedBox(height: 20),
          CustomDetailsTime(food: widget.food),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocConsumer<AddFavoriteCubit, AddFavoriteState>(
                  listener: (context, state) {
                    if (state is AddFavoriteSuccess) {
                      BlocProvider.of<DisplayFavoriteCubitCubit>(
                        context,
                      ).displayFav();
                      snakeBarShow(context, 'Added to fav page!');
                    } else if (state is AddFavoriteFailure) {
                      snakeBarShow(context, 'Failed to add item.');
                    }
                  },
                  builder: (context, state) {
                    return CustomIcon(
                      icon: Icons.favorite,
                      color: Colors.red,
                      size: 36,
                      onPressed: () {
                        BlocProvider.of<AddFavoriteCubit>(
                          context,
                        ).addFavorite(food: widget.food);
                      },
                    );
                  },
                ),
                const CustomCounter(),
              ],
            ),
          ),
          const SizedBox(height: 40),
          Center(
            child: BlocConsumer<CartCubit, CartState>(
              listener: (context, state) {
                if (state is CartSuccess) {
                  BlocProvider.of<DisplayCartCubit>(context).displayCart();
                  snakeBarShow(context, 'Added to cart!');
                } else if (state is CartFailure) {
                  snakeBarShow(context, 'Failed to add item.');
                }
              },
              builder: (context, state) {
                return CustomButton(
                  text: 'Add To Cart',
                  onPressed: () {
                    BlocProvider.of<CartCubit>(
                      context,
                    ).addProduct(food: widget.food, context: context);
                    increaseSum();
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
