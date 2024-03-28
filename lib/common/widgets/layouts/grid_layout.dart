import 'package:flutter/material.dart';
import 'package:sohoj_kart/utils/constants/sizes.dart';

class SKGridLayout extends StatelessWidget {
  const SKGridLayout({
    super.key,
    required this.itemCount,
    this.mainAxisExtent = 288,
    required this.itemBuilder,
  });

  final int itemCount;
  final double? mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: itemCount,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: SKSizes.gridViewSpacing,
          crossAxisSpacing: SKSizes.gridViewSpacing,
          mainAxisExtent: mainAxisExtent),
      itemBuilder: itemBuilder,
    );
  }
}
