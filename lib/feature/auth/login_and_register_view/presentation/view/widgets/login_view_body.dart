import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/helper/snack_bar.dart';
import 'package:food_app/core/utils/app_images.dart';
import 'package:food_app/core/utils/navigation.dart';
import 'package:food_app/core/utils/styles.dart';
import 'package:food_app/feature/auth/login_and_register_view/presentation/manager/cubit/auth_cubit.dart';
import 'package:food_app/feature/auth/login_and_register_view/presentation/view/widgets/custom_button.dart';
import 'package:food_app/feature/auth/login_and_register_view/presentation/view/widgets/custom_text_form_field.dart';
import 'package:food_app/feature/auth/login_and_register_view/presentation/view/widgets/sign_row.dart';
import 'package:go_router/go_router.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  bool isObscure = true;
  String? email, password;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          GoRouter.of(context).push(RouterNavigation.kHomeView);
        } else if (state is LoginFailure) {
          snakeBarShow(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return Form(
          key: formKey,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(Assets.imagesStanding),
                    const SizedBox(height: 30),
                    const Text('Welcome Back', style: Styles.textBold30),
                    const SizedBox(height: 8),
                    const Text(
                      'Lorem ipsum dolor sit amet, consectetur',
                      style: Styles.textLight13,
                    ),
                    const Text(
                      'adipiscing elit. Diam maecenas mi non sed ut',
                      style: Styles.textLight13,
                    ),
                    const Text(
                      'odio. Non, justo, sed facilisi et.',
                      style: Styles.textLight13,
                    ),
                    const SizedBox(height: 30),
                    CustomTextFormField(
                      textInputAction: TextInputAction.next,
                      hintStyle: Styles.textMedium15,
                      icon: Icons.person,
                      hintText: 'Email',
                      onChanged: (value) {
                        email = value;
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      isObscure: isObscure,
                      onPressed: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },

                      textInputAction: TextInputAction.done,
                      hintStyle: Styles.textMedium15,
                      icon: Icons.lock,
                      hintText: 'Password',
                      onChanged: (value) {
                        password = value;
                      },
                    ),
                    const SizedBox(height: 12),
                    const SignRow(),
                    const SizedBox(height: 30),
                    CustomButton(
                      isLoading: state is LoginLoading,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<AuthCubit>(
                            context,
                          ).login(email: email!, password: password!);
                        } else {}
                      },
                      text: 'Login',
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
