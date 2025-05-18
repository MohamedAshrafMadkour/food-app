import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app/core/constant/color_constant.dart';
import 'package:food_app/core/widget/custom_icon.dart';
import 'package:food_app/feature/search/presentation/views/widget/custom_stack_first_container.dart';
import 'package:food_app/feature/search/presentation/views/widget/custom_stack_second_container.dart';
import 'package:food_app/feature/search/presentation/views/widget/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAuthColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: const CustomIcon(
          icon: Icons.sort,
          color: Color(0xffFFFFFF),
          size: 36,
        ),
        actions: const [
          CustomIcon(
            icon: FontAwesomeIcons.cartShopping,
            color: Color(0xffFFFFFF),
          ),
        ],
      ),
      body: Stack(
        children: [
          const CustomStackFirstContainer(),
          Positioned.fill(
            top: MediaQuery.of(context).size.height * 0.45 - 180,
            child: const CustomStackSecondContainer(),
          ),

          const SearchViewBody(),
        ],
      ),
    );
  }
}
