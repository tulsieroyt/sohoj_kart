import 'package:flutter/material.dart';
import 'package:sohoj_kart/common/widgets/custom_shapes/container/circular_container.dart';
import 'package:sohoj_kart/common/widgets/custom_shapes/custom_edges/curved_edges_widget.dart';
import 'package:sohoj_kart/utils/constants/colors.dart';

class SKPrimaryHeaderContainer extends StatelessWidget {
  const SKPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SKCurvedEdgeWidget(
      child: Container(
        color: SKColors.primary,
        padding: const EdgeInsets.all(0),

        ///If you don't provide a child with infinite space, it will through an error
        child: Stack(
          children: [
            Positioned(
              top: -150,
              right: -250,
              child: SKCircularContainer(
                backgroundColor: SKColors.textWhite.withOpacity(0.1),
              ),
            ),
            Positioned(
              top: 150,
              right: -300,
              child: SKCircularContainer(
                backgroundColor: SKColors.textWhite.withOpacity(0.1),
              ),
            ),
            child
          ],
        ),
      ),
    );
  }
}
