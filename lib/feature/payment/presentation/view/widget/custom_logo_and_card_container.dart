import 'package:flutter/material.dart';
import 'package:food_app/core/utils/app_images.dart';
import 'package:food_app/core/utils/styles.dart';
import 'package:svg_flutter/svg.dart';

class CustomLogoAndCardContainer extends StatelessWidget {
  const CustomLogoAndCardContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: ShapeDecoration(
        color: const Color(0xffFFFFFF),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      child: Row(
        children: [
          SvgPicture.asset(Assets.imagesLogo),
          const SizedBox(width: 20),
          Text.rich(
            TextSpan(
              children: [
                const TextSpan(
                  text: 'Credit Card',
                  style: Styles.textRegular18,
                ),
                TextSpan(
                  text: '\nMastercard **78',
                  style: Styles.textRegular18.copyWith(
                    color: const Color.fromRGBO(0, 0, 0, 0.7),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
