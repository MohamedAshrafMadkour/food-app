import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_app/feature/pop_up/data/models/tasty_api_model/tasty_api_model.dart';
import 'package:shimmer/shimmer.dart';

class CustomMealCachedImage extends StatelessWidget {
  const CustomMealCachedImage({super.key, required this.meal});
  final TastyApiModel meal;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * .27,
      child: AspectRatio(
        aspectRatio: 2.7 / 1.9,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: CachedNetworkImage(
            fit: BoxFit.fill,
            imageUrl: meal.thumbnailUrl ?? " ",
            placeholder:
                (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(color: Colors.white),
                ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
