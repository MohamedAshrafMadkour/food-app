import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/widget/custom_shimmer.dart';
import 'package:food_app/core/widget/message_error.dart';
import 'package:food_app/feature/search/presentation/manager/food_type_cubit/food_type_cubit.dart';
import 'package:food_app/feature/search/presentation/views/widget/food_card.dart';

class FoodCardList extends StatelessWidget {
  const FoodCardList({super.key, required this.selectedCategory});
  final String selectedCategory;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodTypeCubit, FoodTypeState>(
      builder: (context, state) {
        if (state is FoodTypeSuccess) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: state.type.length,
            itemBuilder: (context, index) {
              return FoodCard(meal: state.type[index]);
            },
          );
        } else if (state is FoodTypeFailure) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ErrorMessage(errorMessage: state.error),
          );
        } else {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return const MealCardShimmer();
            },
          );
        }
      },
    );
  }
}
