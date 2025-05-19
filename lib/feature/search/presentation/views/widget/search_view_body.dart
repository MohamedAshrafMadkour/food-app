import 'package:flutter/material.dart';
import 'package:food_app/feature/search/presentation/views/widget/custom_text_field.dart';
import 'package:food_app/feature/search/presentation/views/widget/search_item_grid.dart';

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
          SizedBox(height: 20),
          Expanded(child: SearchItemGrid()),
        ],
      ),
    );
  }
}
