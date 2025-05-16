import 'package:flutter/widgets.dart';
import 'package:food_app/core/utils/styles.dart';
import 'package:food_app/feature/auth/login_and_regitser_view/view/widgets/custom_sign_and_register_container.dart';

class CustomEnterContainerRow extends StatelessWidget {
  const CustomEnterContainerRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
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
              style: Styles.textSemiBold22,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              color: Color(0xffDADADA),
              text: 'Register',
            ),
          ),
        ],
      ),
    );
  }
}
