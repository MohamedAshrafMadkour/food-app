import 'package:flutter/material.dart';

class CustomStackSecondContainer extends StatelessWidget {
  const CustomStackSecondContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Color(0xffFCB495), width: 3),
          left: BorderSide(color: Color(0xffFCB495), width: .5),
          right: BorderSide(color: Color(0xffFCB495), width: .5),
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
        color: Color.fromRGBO(237, 243, 237, .9),
      ),
    );
  }
}
