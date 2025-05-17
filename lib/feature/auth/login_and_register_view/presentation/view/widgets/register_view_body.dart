import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/helper/snack_bar.dart';
import 'package:food_app/core/utils/app_images.dart';
import 'package:food_app/core/utils/navigation.dart';
import 'package:food_app/feature/auth/login_and_register_view/presentation/manager/cubit/auth_cubit.dart';
import 'package:food_app/feature/auth/login_and_register_view/presentation/view/widgets/custom_button.dart';
import 'package:food_app/feature/auth/login_and_register_view/presentation/view/widgets/custom_text_form_field.dart';
import 'package:go_router/go_router.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  String? userName, email, password;
  GlobalKey<FormState> formKey = GlobalKey();
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          GoRouter.of(context).push(RouterNavigation.kCompleteRegisterView);
        } else if (state is RegisterFailure) {
          snakeBarShow(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: formKey,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(Assets.imagesLogin1),
                    const SizedBox(height: 70),
                    CustomTextFormField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      icon: Icons.email,
                      hintText: 'Email',
                      onChanged: (value) {
                        email = value;
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                      icon: Icons.person,
                      hintText: 'Username',
                      onChanged: (value) {
                        userName = value;
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      textInputAction: TextInputAction.done,
                      icon: Icons.lock,
                      onPressed: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                      hintText: 'Password',
                      onChanged: (value) {
                        password = value;
                      },
                      isObscure: isObscure,
                      sufIcon:
                          isObscure ? Icons.visibility_off : Icons.visibility,
                    ),
                    const SizedBox(height: 40),
                    CustomButton(
                      isLoading: state is RegisterLoading,
                      onPressed: () {
                        GoRouter.of(
                          context,
                        ).push(RouterNavigation.kCompleteRegisterView);
                      },
                      text: 'Register',
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
