import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/utils/navigation.dart';
import 'package:food_app/core/utils/styles.dart';
import 'package:food_app/core/widget/custom_icon.dart';
import 'package:food_app/feature/auth/login_and_register_view/presentation/manager/cubit/auth_cubit.dart';
import 'package:food_app/feature/home/presentation/view/widgets/home_view_body.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        elevation: 0,
        leading: CustomIcon(
          icon: Icons.logout,
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: ListTile(
                    title: const Text('Are You Sure', style: Styles.textBold30),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            BlocProvider.of<AuthCubit>(context).signOut();
                            GoRouter.of(context).pushReplacement(
                              RouterNavigation.kLoginAndRegisterView,
                            );
                          },
                          child: Text(
                            'confirm',
                            style: Styles.textBold22.copyWith(
                              color: Colors.black,
                            ),
                          ),
                        ),

                        InkWell(
                          onTap: GoRouter.of(context).pop,
                          child: Text(
                            'No',
                            style: Styles.textBold22.copyWith(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
        actions: [
          CustomIcon(
            icon: Icons.search,
            onPressed: () {
              GoRouter.of(context).push(RouterNavigation.kSearchView);
            },
          ),
        ],
      ),
      body: const HomeViewBody(),
    );
  }
}
