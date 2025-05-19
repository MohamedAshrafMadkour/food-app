import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/feature/search/presentation/manager/country_food/country_food_cubit.dart';
import 'package:go_router/go_router.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({super.key});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onSubmitted: (query) {
        if (query.trim().isNotEmpty) {
          context.read<CountryFoodCubit>().getCountryFoodCubitMethod(
            country: query.trim(),
          );
        }
      },
      decoration: InputDecoration(
        fillColor: const Color.fromRGBO(255, 249, 243, .3),
        filled: true,

        prefixIcon: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back, color: Color(0xffFFF9F3)),
        ),
        suffixIcon:
            controller.text.isNotEmpty
                ? IconButton(
                  onPressed: () {
                    setState(() {
                      controller.clear();
                    });
                    context.read<CountryFoodCubit>().remove();
                  },
                  icon: const Icon(Icons.clear, color: Color(0xffFFF9F3)),
                )
                : IconButton(
                  onPressed: () {
                    if (controller.text.trim().isNotEmpty) {
                      setState(() {});
                      context
                          .read<CountryFoodCubit>()
                          .getCountryFoodCubitMethod(
                            country: controller.text.trim(),
                          );
                    }
                  },
                  icon: const Icon(Icons.search, color: Color(0xffFFF9F3)),
                ),
        hintText: 'Enter Nationality',
        hintStyle: const TextStyle(color: Color(0xffFFF9F3)),
        border: customOutlineInputBorder(color: Colors.black),
        focusedBorder: customOutlineInputBorder(
          color: const Color.fromRGBO(255, 249, 243, .1),
        ),
        enabledBorder: customOutlineInputBorder(
          color: const Color.fromRGBO(255, 249, 243, .1),
        ),
      ),
    );
  }

  OutlineInputBorder customOutlineInputBorder({required Color color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: color),
    );
  }
}
