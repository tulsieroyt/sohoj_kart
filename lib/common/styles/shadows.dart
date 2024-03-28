import 'package:flutter/cupertino.dart';
import 'package:sohoj_kart/utils/constants/colors.dart';

class SKShadowStyle{
  static final verticalProductShadow = BoxShadow(
    color: SKColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2)
  );
  static final horizontalProductShadow = BoxShadow(
      color: SKColors.darkGrey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2)
  );
}