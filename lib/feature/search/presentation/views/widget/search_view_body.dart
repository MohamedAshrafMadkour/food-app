import 'package:flutter/material.dart';
import 'package:food_app/feature/search/presentation/views/widget/category_list.dart';
import 'package:food_app/feature/search/presentation/views/widget/custom_text_field.dart';
import 'package:food_app/feature/search/presentation/views/widget/food_card_list.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Column(
        children: [
          SizedBox(height: 20),
          CustomTextField(),
          SizedBox(height: 30),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: CategoryList()),
                FoodCardList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
