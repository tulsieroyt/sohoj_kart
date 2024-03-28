import 'package:flutter/material.dart';
import 'package:sohoj_kart/common/widgets/layouts/grid_layout.dart';
import 'package:sohoj_kart/utils/constants/sizes.dart';
import 'package:sohoj_kart/utils/shimmer/shimmer_effect.dart';

class SKVerticalProductShimmer extends StatelessWidget {
  const SKVerticalProductShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SKGridLayout(
      itemCount: itemCount,
      itemBuilder: (_, __) {
        return const SizedBox(
          height: 180,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ///Image
              SKShimmerEffect(height: 180, width: 180),
              SizedBox(height: SKSizes.spaceBtwItems),

              ///Text
              SKShimmerEffect(height: 15, width: 160),
              SizedBox(height: SKSizes.spaceBtwItems / 2),
              SKShimmerEffect(height: 15, width: 110),
            ],
          ),
        );
      },
    );
  }
}
