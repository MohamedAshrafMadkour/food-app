import 'package:flutter/widgets.dart';
import 'package:food_app/core/utils/navigation.dart';
import 'package:food_app/core/utils/styles.dart';
import 'package:food_app/feature/auth/login_and_register_view/view/widgets/custom_sign_and_register_container.dart';
import 'package:go_router/go_router.dart';

class CustomEnterContainerRow extends StatelessWidget {
  const CustomEnterContainerRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          const Expanded(
            child: CustomSignAndRegisterContainerButton(
              style: Styles.textBold22,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                topLeft: Radius.circular(12),
              ),
              color: Color(0xff2DB6A3),
              text: 'Sign In',
            ),
          ),
          Expanded(
            child: CustomSignAndRegisterContainerButton(
              onTap: () {
                GoRouter.of(context).push(RouterNavigation.kRegisterView);
              },
              style: Styles.textSemiBold22,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              color: const Color(0xffDADADA),
              text: 'Register',
            ),
          ),
        ],
      ),
    );
  }
}
