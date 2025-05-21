import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      thickness: 2,
      height: 40,
      color: Color(0xffC7C7C7),
      endIndent: 12,
      indent: 15,
    );
  }
}
