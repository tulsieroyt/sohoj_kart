import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sohoj_kart/common/widgets/texts/sk_brand_title_text.dart';
import 'package:sohoj_kart/utils/constants/colors.dart';
import 'package:sohoj_kart/utils/constants/enums.dart';
import 'package:sohoj_kart/utils/constants/sizes.dart';

class SKBrandTitleWithVerifiedIcon extends StatelessWidget {
  const SKBrandTitleWithVerifiedIcon({
    super.key,
    required this.title,
    this.maxLine = 1,
    this.textColor,
    this.iconColor = SKColors.primary,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small,
  });

  final String title;
  final int maxLine;
  final Color? textColor, iconColor;
  final TextAlign textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          SKBrandTitleText(
            title: title,
            maxLine: maxLine,
            color: textColor,
            textAlign: textAlign,
            brandTextSize: brandTextSize,
          ),
          const SizedBox(width: SKSizes.xs),
          const Icon(
            Iconsax.verify5,
            color: SKColors.primary,
            size: SKSizes.iconXs,
          )
        ],
      ),
    );
  }
}
