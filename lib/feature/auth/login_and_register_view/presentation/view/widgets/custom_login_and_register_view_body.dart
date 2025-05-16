import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/utils/app_images.dart';
import 'package:food_app/core/utils/styles.dart';
import 'package:food_app/feature/auth/login_and_register_view/presentation/manager/cubit/auth_cubit.dart';
import 'package:food_app/feature/auth/login_and_register_view/presentation/view/widgets/custom_enter_container_row.dart';

class CustomLoginAndRegisterViewBody extends StatelessWidget {
  const CustomLoginAndRegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Image.asset(
            Assets.imagesDash,
            fit: BoxFit.fill,
            height: size.height * .23,
            width: size.width * .53,
          ),
          const SizedBox(height: 50),
          const Text('Foodienator', style: Styles.textExtraBold33),
          const SizedBox(height: 10),
          const Text('Order your favorite Meals', style: Styles.textLight14),
          const Text('Here!', style: Styles.textLight14),
          SizedBox(height: size.height * .17),
          BlocProvider(
            create: (context) => AuthCubit(),
            child: const CustomEnterContainerRow(),
          ),
          SizedBox(height: size.height * .14),
        ],
      ),
    );
  }
}
