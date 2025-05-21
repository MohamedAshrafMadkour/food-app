import 'package:flutter/material.dart';
import 'package:food_app/core/utils/app_images.dart';
import 'package:food_app/core/utils/styles.dart';
import 'package:svg_flutter/svg.dart';

AppBar customAppBarCart({
  required String title,
  required BuildContext context,
}) {
  return AppBar(
    centerTitle: true,
    elevation: 0,
    backgroundColor: Colors.transparent,
    leading: Center(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: SvgPicture.asset(Assets.imagesArrow),
      ),
    ),
    title: Text(title, style: Styles.textBold30),
  );
}
