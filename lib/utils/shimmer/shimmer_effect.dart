import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sohoj_kart/utils/constants/colors.dart';
import 'package:sohoj_kart/utils/helpers/helper_functions.dart';

class SKShimmerEffect extends StatelessWidget {
  const SKShimmerEffect({
    super.key,
    required this.height,
    required this.width,
    this.radius = 15,
    this.color,
  });

  final double height, width, radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final darkMode = SKHelperFunctions.isDarkMode(context);
    return Shimmer.fromColors(
      baseColor: darkMode ? Colors.grey[850]! : Colors.grey[300]!,
      highlightColor: darkMode ? Colors.grey[700]! : Colors.grey[100]!,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color ?? (darkMode ? SKColors.darkerGrey : SKColors.white),
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
