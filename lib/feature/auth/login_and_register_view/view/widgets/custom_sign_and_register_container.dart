import 'package:flutter/widgets.dart';

class CustomSignAndRegisterContainerButton extends StatelessWidget {
  const CustomSignAndRegisterContainerButton({
    super.key,
    required this.borderRadius,
    required this.color,
    required this.text,
    this.style,
    this.onTap,
  });
  final BorderRadiusGeometry borderRadius;
  final Color color;
  final String text;
  final TextStyle? style;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80,
        decoration: ShapeDecoration(
          color: color,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
        child: Center(child: Text(text, style: style)),
      ),
    );
  }
}
