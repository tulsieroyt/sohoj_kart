import 'package:flutter/material.dart';
import 'package:sohoj_kart/common/widgets/custom_shapes/custom_edges/curved_edges.dart';

class SKCurvedEdgeWidget extends StatelessWidget {
  const SKCurvedEdgeWidget({
    super.key, this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: SKCustomEdges(),
      child: child,
    );
  }
}