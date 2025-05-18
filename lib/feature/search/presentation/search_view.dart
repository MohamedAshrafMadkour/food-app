import 'package:flutter/material.dart';
import 'package:food_app/feature/search/presentation/views/widget/custom_stack_first_container.dart';
import 'package:food_app/feature/search/presentation/views/widget/custom_stack_second_container.dart';
import 'package:food_app/feature/search/presentation/views/widget/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const CustomStackFirstContainer(),
          Positioned.fill(
            top: MediaQuery.of(context).size.height * 0.45 - 70,
            child: const CustomStackSecondContainer(),
          ),
          const SearchViewBody(),
        ],
      ),
    );
  }
}
