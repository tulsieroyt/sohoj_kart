import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../custom_shapes/container/rounded_container.dart';

class SKCouponCode extends StatelessWidget {
  const SKCouponCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final darkMode = SKHelperFunctions.isDarkMode(context);
    return SKRoundedContainer(
      showBorder: true,
      backgroundColor: darkMode ? SKColors.dark : SKColors.white,
      padding: const EdgeInsets.only(
        top: SKSizes.sm,
        bottom: SKSizes.sm,
        right: SKSizes.sm,
        left: SKSizes.md,
      ),
      child: Row(
        children: [
          ///TextField
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Have a promo code? Enter here',
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),

          ///Button
          SizedBox(
            width: 80,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: darkMode
                    ? SKColors.white.withOpacity(0.5)
                    : SKColors.dark.withOpacity(0.5),
                backgroundColor: SKColors.grey.withOpacity(0.2),
                side: BorderSide(
                  color: SKColors.grey.withOpacity(0.1),
                ),
              ),
              child: const Text('Apply'),
            ),
          ),
        ],
      ),
    );
  }
}