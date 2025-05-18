import 'package:flutter/material.dart';
import 'package:food_app/feature/search/presentation/views/widget/category.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int currentIndex = 0;
  List<String> meals = ['Pizza', 'Veggies', 'Chicken', 'meat'];
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
                setState(() {
                  currentIndex = index;
                });
              },
              isActive: currentIndex == index,
            ),
          );
        },
      ),
    );
  }
}
