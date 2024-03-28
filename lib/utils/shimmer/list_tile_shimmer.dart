import 'package:flutter/material.dart';
import 'package:sohoj_kart/utils/constants/sizes.dart';
import 'package:sohoj_kart/utils/shimmer/shimmer_effect.dart';

class SKListTileShimmerEffect extends StatelessWidget {
  const SKListTileShimmerEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            SKShimmerEffect(height: 50, width: 50, radius: 50),
            SizedBox(width: SKSizes.spaceBtwItems / 2),
            SKShimmerEffect(height: 50, width: 50, radius: 50)
          ],
        )
      ],
    );
  }
}
