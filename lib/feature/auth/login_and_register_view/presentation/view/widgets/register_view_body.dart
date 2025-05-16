import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/utils/app_images.dart';
import 'package:food_app/feature/auth/login_and_register_view/presentation/manager/cubit/auth_cubit.dart';
import 'package:food_app/feature/auth/login_and_register_view/presentation/view/widgets/custom_button.dart';
import 'package:food_app/feature/auth/login_and_register_view/presentation/view/widgets/custom_text_form_field.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  String? userName, email, password;
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
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
                  icon: Icons.email,
                  hintText: 'Email',
                  onChanged: (value) {
                    email = value;
                  },
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  icon: Icons.person,
                  hintText: 'Username',
                  onChanged: (value) {
                    userName = value;
                  },
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  icon: Icons.lock,
                  hintText: 'Password',
                  onChanged: (value) {
                    password = value;
                  },
                  sufIcon: Icons.visibility,
                ),
                const SizedBox(height: 40),
                CustomButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      BlocProvider.of<AuthCubit>(context).register(
                        name: userName!,
                        email: email!,
                        password: password!,
                      );
                    } else {}
                  },
                  text: 'Register',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
