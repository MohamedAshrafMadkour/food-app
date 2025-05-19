import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/feature/search/presentation/manager/food_type_cubit/food_type_cubit.dart';
import 'package:food_app/feature/search/presentation/views/widget/category.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    super.key,
    required this.meals,
    required this.currentIndex,
    required this.onCategorySelected,
  });
  final List<String> meals;
  final int currentIndex;
  final void Function(int) onCategorySelected;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .07,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: meals.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Category(
              meal: meals[index],
              onTap: () {
                if (currentIndex != index) {
                  onCategorySelected(index);
                  BlocProvider.of<FoodTypeCubit>(
                    context,
                  ).getFoodTypeCubitMethod(type: meals[index]);
                }
              },
              isActive: currentIndex == index,
            ),
          );
        },
      ),
    );
  }
}
