import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/widget/custom_shimmer.dart';
import 'package:food_app/core/widget/message_error.dart';
import 'package:food_app/feature/search/presentation/manager/country_food/country_food_cubit.dart';
import 'package:food_app/feature/search/presentation/manager/food_type_cubit/food_type_cubit.dart';
import 'package:food_app/feature/search/presentation/views/widget/category_list.dart';
import 'package:food_app/feature/search/presentation/views/widget/food_card_list.dart';
import 'package:food_app/feature/search/presentation/views/widget/search_item.dart';

class SearchItemGrid extends StatefulWidget {
  const SearchItemGrid({super.key});

  @override
  State<SearchItemGrid> createState() => _SearchItemGridState();
}

class _SearchItemGridState extends State<SearchItemGrid> {
  int currentIndex = 0;

  final List<String> meals = const ['Chicken', 'Fish', 'Vegetarian', 'Beef'];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<FoodTypeCubit>(
        context,
      ).getFoodTypeCubitMethod(type: meals[currentIndex]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        BlocBuilder<CountryFoodCubit, CountryFoodState>(
          builder: (context, state) {
            if (state is CountryFoodSuccess) {
              return SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: .9,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  crossAxisCount: 2,
                ),
                delegate: SliverChildBuilderDelegate(
                  childCount: state.country.length,
                  (context, index) {
                    return SearchItem(countryFood: state.country[index]);
                  },
                ),
              );
            } else if (state is CountryFoodFailure) {
              return SliverToBoxAdapter(
                child: ErrorMessage(errorMessage: state.error),
              );
            } else if (state is CountryFoodLoading) {
              return SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: .9,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  crossAxisCount: 2,
                ),
                delegate: SliverChildBuilderDelegate(childCount: 10, (
                  context,
                  index,
                ) {
                  return const SearchItemShimmer();
                }),
              );
            } else {
              return SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CategoryList(
                      meals: meals,
                      onCategorySelected: (index) {
                        setState(() {
                          currentIndex = index;
                          BlocProvider.of<FoodTypeCubit>(
                            context,
                          ).getFoodTypeCubitMethod(type: meals[currentIndex]);
                        });
                      },
                      currentIndex: currentIndex,
                    ),
                    FoodCardList(selectedCategory: meals[currentIndex]),
                  ],
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
