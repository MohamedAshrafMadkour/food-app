import 'package:flutter/material.dart';
import 'package:food_app/core/utils/app_images.dart';
import 'package:food_app/core/utils/styles.dart';

class CustomCardRow extends StatelessWidget {
  const CustomCardRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Grilled Beef', style: Styles.textRegular18),
              SizedBox(height: 4),
              Text(
                'Spicy grilled beef with special seasoning',
                style: Styles.textRegular13,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 8),
              Text(r'$ 4000.00', style: Styles.textSemiBold15),
            ],
          ),
        ),
        const SizedBox(width: 12),
        ClipRRect(
          borderRadius: BorderRadius.zero,
          child: Image.asset(
            Assets.imagesFirst,
            width: MediaQuery.sizeOf(context).width * .27,
            height: MediaQuery.sizeOf(context).height * .08,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
