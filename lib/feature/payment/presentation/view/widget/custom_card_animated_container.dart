import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class CustomCardAnimatedContainer extends StatelessWidget {
  const CustomCardAnimatedContainer({
    super.key,
    required this.isActive,
    required this.image,
  });
  final bool isActive;
  final String image;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      child: Container(
        height: 80,
        width: 120,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1.5,
              color: isActive ? const Color(0xff34A853) : Colors.grey,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          shadows: [
            BoxShadow(
              blurRadius: 4,
              color: isActive ? const Color(0xff34A853) : Colors.white,
              offset: const Offset(0, 0),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Container(
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1.5, color: Colors.white),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Center(
            child: SvgPicture.asset(image, height: 35, fit: BoxFit.scaleDown),
          ),
        ),
      ),
    );
  }
}
