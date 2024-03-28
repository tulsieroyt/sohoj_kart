import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sohoj_kart/utils/constants/colors.dart';
import 'package:sohoj_kart/utils/constants/sizes.dart';
import 'package:sohoj_kart/utils/helpers/helper_functions.dart';
import 'package:sohoj_kart/utils/shimmer/shimmer_effect.dart';

class SKCircularImage extends StatelessWidget {
  const SKCircularImage({
    super.key,
    required this.image,
    this.fit = BoxFit.cover,
    this.isNetworkImage = false,
    this.overlayColor,
    this.backgroundColor,
    this.padding = SKSizes.sm,
    this.width = 56,
    this.height = 56,
  });

  final String image;
  final BoxFit fit;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double padding, width, height;

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('Link is $image');
    }
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ??
            (SKHelperFunctions.isDarkMode(context)
                ? SKColors.black
                : SKColors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: isNetworkImage
            ? CachedNetworkImage(
                fit: fit,
                imageUrl: image,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    const SKShimmerEffect(
                  height: 55,
                  width: 55,
                  radius: 55,
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              )
            : Image(
                fit: fit,
                image: AssetImage(image),
                color: overlayColor,
              ),
      ),
    );
  }
}
