import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../icon/sk_circular_icon.dart';

class SKProductQuantityWithAddOrRemoveButton extends StatelessWidget {
  const SKProductQuantityWithAddOrRemoveButton({
    super.key,
    required this.quantity,
    this.add,
    this.remove,
  });

  final int quantity;
  final VoidCallback? add, remove;

  @override
  Widget build(BuildContext context) {
    final darkMode = SKHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SKCircularIcon(
          icon: Iconsax.minus,
          height: 32,
          width: 32,
          size: SKSizes.md,
          color: darkMode ? Colors.white : SKColors.black,
          backgroundColor: darkMode ? SKColors.darkerGrey : SKColors.light,
          onPressed: remove,
        ),
        const SizedBox(width: SKSizes.spaceBtwItems),
        Text(quantity.toString(), style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: SKSizes.spaceBtwItems),
        SKCircularIcon(
          icon: Iconsax.add,
          height: 32,
          width: 32,
          size: SKSizes.md,
          color: darkMode ? Colors.white : SKColors.black,
          backgroundColor: darkMode ? SKColors.darkerGrey : SKColors.light,
          onPressed: add,
        )
      ],
    );
  }
}
