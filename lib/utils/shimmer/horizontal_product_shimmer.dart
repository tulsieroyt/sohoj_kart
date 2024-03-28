import 'package:flutter/material.dart';
import 'package:sohoj_kart/utils/constants/sizes.dart';
import 'package:sohoj_kart/utils/shimmer/shimmer_effect.dart';

class SKHorizontalProductShimmerEffect extends StatelessWidget {
  const SKHorizontalProductShimmerEffect({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: SKSizes.spaceBtwSections),
      height: 120,
      child: ListView.separated(
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) =>
            const SizedBox(width: SKSizes.spaceBtwItems),
        itemBuilder: (_, __) => const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ///Image
            SKShimmerEffect(height: 120, width: 120, radius: 120),
            SizedBox(width: SKSizes.spaceBtwItems),

            ///Text
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: SKSizes.spaceBtwItems / 2),
                SKShimmerEffect(height: 15, width: 160),
                SizedBox(height: SKSizes.spaceBtwItems / 2),
                SKShimmerEffect(height: 15, width: 110),
                SizedBox(height: SKSizes.spaceBtwItems / 2),
                SKShimmerEffect(height: 15, width: 80),
                Spacer(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
