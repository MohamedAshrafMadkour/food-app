import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/widget/custom_shimmer.dart';
import 'package:food_app/core/widget/message_error.dart';
import 'package:food_app/feature/pop_up/presentation/manager/cubit/meals_food_cubit.dart';
import 'package:food_app/feature/pop_up/presentation/view/widget/meals_card.dart';

class MealCardList extends StatelessWidget {
  const MealCardList({super.key, required this.meal});
  final String meal;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealsFoodCubit, MealsFoodState>(
      builder: (context, state) {
        if (state is MealsFoodSuccess) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => MealCard(meal: state.food[index]),
              childCount: state.food.length,
            ),
          );
        } else if (state is MealsFoodFailure) {
          return SliverToBoxAdapter(
            child: ErrorMessage(errorMessage: state.error),
          );
        } else {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => const MealCardShimmer(),
              childCount: 10,
            ),
          );
        }
      },
    );
  }
}
