import 'package:flutter/material.dart';
import 'package:sohoj_kart/common/widgets/layouts/grid_layout.dart';
import 'package:sohoj_kart/utils/shimmer/shimmer_effect.dart';

class SKBrandShimmerEffect extends StatelessWidget {
  const SKBrandShimmerEffect({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SKGridLayout(
        itemCount: itemCount,
        itemBuilder: (_, __) => const SKShimmerEffect(height: 80, width: 300));
  }
}
