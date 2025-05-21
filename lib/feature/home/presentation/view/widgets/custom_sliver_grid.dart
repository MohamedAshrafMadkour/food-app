import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/widget/custom_shimmer.dart';
import 'package:food_app/core/widget/message_error.dart';
import 'package:food_app/feature/home/presentation/view/manager/main_food/main_food_cubit.dart';
import 'package:food_app/feature/home/presentation/view/widgets/home_item_food.dart';

class CustomSliverGrid extends StatefulWidget {
  const CustomSliverGrid({super.key});

  @override
  State<CustomSliverGrid> createState() => _CustomSliverGridState();
}

class _CustomSliverGridState extends State<CustomSliverGrid> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<MainFoodCubit>(context).getMainFoodCubitMethod();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainFoodCubit, MainFoodState>(
      builder: (context, state) {
        if (state is GetMainFoodSuccess) {
          return SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: .75,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              crossAxisCount: 2,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) => HomeFoodItem(food: state.food[index]),
              childCount: state.food.length,
            ),
          );
        } else if (state is GetMainFoodFailure) {
          return SliverToBoxAdapter(
            child: ErrorMessage(errorMessage: state.error),
          );
        } else {
          return SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: .75,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              crossAxisCount: 2,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) => const HomeFoodItemShimmer(),
              childCount: 10,
            ),
          );
        }
      },
    );
  }
}
