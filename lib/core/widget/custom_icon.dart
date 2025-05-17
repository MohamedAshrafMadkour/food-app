import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    super.key,
    required this.icon,
    this.onPressed,
    this.color,
    this.size,
  });
  final IconData icon;
  final void Function()? onPressed;
  final Color? color;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon, size: size ?? 30, color: color),
      onPressed: onPressed,
    );
  }
}
