import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sohoj_kart/utils/constants/colors.dart';
import 'package:sohoj_kart/utils/constants/sizes.dart';
import 'package:sohoj_kart/utils/device/device_utility.dart';
import 'package:sohoj_kart/utils/helpers/helper_functions.dart';

class SKSearchContainer extends StatelessWidget {
  const SKSearchContainer({
    super.key,
    this.icon = Iconsax.search_normal,
    required this.text,
    this.showBorder = true,
    this.showBackground = true,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: SKSizes.defaultSpace),
  });

  final String text;
  final IconData? icon;
  final bool showBorder, showBackground;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final darkMode = SKHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          width: SKDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(SKSizes.md),
          decoration: BoxDecoration(
            color: showBackground
                ? darkMode
                    ? SKColors.dark
                    : SKColors.white
                : Colors.transparent,
            borderRadius: BorderRadius.circular(SKSizes.cardRadiusLg),
            border: showBorder ? Border.all(color: Colors.grey) : null,
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: SKColors.darkerGrey,
              ),
              const SizedBox(width: SKSizes.spaceBtwItems),
              Text(
                text,
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          ),
        ),
      ),
    );
  }
}
