import 'package:flutter/material.dart';
import 'package:food_app/core/constant/color_constant.dart';
import 'package:food_app/core/utils/styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.icon,
    required this.hintText,
    this.sufIcon,
    this.hintStyle,
    this.onChanged,
  });
  final TextStyle? hintStyle;
  final IconData icon;
  final String hintText;
  final IconData? sufIcon;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Empty Field';
        }
        return null;
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        fillColor: const Color(0xffF3F3F3),
        filled: true,
        hintText: hintText,
        hintStyle:
            hintStyle ?? Styles.textRegular25.copyWith(color: Colors.grey[500]),
        prefixIcon: Icon(icon, size: 34, color: kAuthColor),
        suffixIcon: Icon(sufIcon, size: 34, color: kAuthColor),
        enabledBorder: outlineInputBorder(),
        border: outlineInputBorder(),
        focusedBorder: outlineInputBorder(borderColor: kAuthColor),
      ),
    );
  }

  OutlineInputBorder outlineInputBorder({
    Color borderColor = const Color(0xffF3F3F3),
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: borderColor, width: 1),
    );
  }
}
