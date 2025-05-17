import 'package:flutter/material.dart';
import 'package:food_app/core/constant/color_constant.dart';
import 'package:food_app/core/utils/app_images.dart';
import 'package:food_app/core/utils/styles.dart';
import 'package:food_app/core/widget/custom_end_icon.dart';
import 'package:food_app/core/widget/custom_icon.dart';
import 'package:food_app/feature/auth/login_and_register_view/presentation/view/widgets/custom_button.dart';
import 'package:food_app/feature/home/presentation/view/widgets/counter.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: CustomDetailsImage(),
          ),
          SizedBox(height: 50),
          CustomDetailsDataRow(),
          CustomDetailsDescription(),
          SizedBox(height: 20),
          CustomDetailsTime(),
          SizedBox(height: 40),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomIcon(icon: Icons.favorite, color: Colors.red, size: 36),
                CustomCounter(),
              ],
            ),
          ),
          SizedBox(height: 50),
          Center(child: CustomButton(text: 'AddToCart')),
        ],
      ),
    );
  }
}

class CustomDetailsImage extends StatelessWidget {
  const CustomDetailsImage({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3.8 / 2.7,
      child: ClipRRect(
        child: Image.asset(Assets.imagesFirst, fit: BoxFit.fill),
      ),
    );
  }
}

class CustomDetailsTime extends StatelessWidget {
  const CustomDetailsTime({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomBorderIcon(icon: Icons.schedule, color: Color(0xffC4C4C4)),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Delivery Time', style: Styles.textSemiBold16),
              Text('25 minutes', style: Styles.textRegular14),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomDetailsDescription extends StatelessWidget {
  const CustomDetailsDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -12),
      child: const Padding(
        padding: EdgeInsets.only(left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('About this product', style: Styles.textMedium18),
            Text(
              'Crunchy beef burger with onion and lettuce',
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              style: Styles.textRegular14,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomDetailsDataRow extends StatelessWidget {
  const CustomDetailsDataRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text(
            'Beef Burger',
            style: Styles.textBold32.copyWith(color: Colors.black),
          ),
        ),
        const CustomDetailsPriceContainer(),
      ],
    );
  }
}

class CustomDetailsPriceContainer extends StatelessWidget {
  const CustomDetailsPriceContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * .3,
      height: MediaQuery.sizeOf(context).height * .07,
      decoration: const ShapeDecoration(
        color: kAuthColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(32),
            topLeft: Radius.circular(32),
          ),
        ),
      ),
      child: Center(
        child: Text(
          r'$ 3500.00',
          style: Styles.textSemiBold15.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
