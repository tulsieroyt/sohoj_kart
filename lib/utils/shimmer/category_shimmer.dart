import 'package:flutter/material.dart';
import 'package:sohoj_kart/utils/constants/sizes.dart';
import 'package:sohoj_kart/utils/shimmer/shimmer_effect.dart';

class SKCategoryShimmerEffect extends StatelessWidget {
  const SKCategoryShimmerEffect({super.key, this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 80,
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: itemCount,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (_, __) => const SizedBox(
            width: SKSizes.spaceBtwItems,
          ),
          itemBuilder: (_, __) {
            return const Column(
              children: [
                //Image
                SKShimmerEffect(height: 55, width: 55, radius: 55),
                SizedBox(height: SKSizes.spaceBtwItems / 2),

                //Text
                SKShimmerEffect(height: 8, width: 55),
              ],
            );
          },
        ));
  }
}
