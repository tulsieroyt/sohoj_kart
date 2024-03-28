import 'package:flutter/material.dart';
import 'package:sohoj_kart/utils/constants/sizes.dart';
import 'package:sohoj_kart/utils/shimmer/shimmer_effect.dart';

class SKBoxShimmerEffect extends StatelessWidget {
  const SKBoxShimmerEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(child: SKShimmerEffect(height: 150, width: 110)),
            SizedBox(height: SKSizes.spaceBtwItems),
            Expanded(child: SKShimmerEffect(height: 150, width: 110)),
            SizedBox(height: SKSizes.spaceBtwItems),
            Expanded(child: SKShimmerEffect(height: 150, width: 110)),

          ],
        )
      ],
    );
  }
}
