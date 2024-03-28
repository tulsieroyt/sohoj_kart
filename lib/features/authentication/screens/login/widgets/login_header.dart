import 'package:flutter/material.dart';
import 'package:sohoj_kart/utils/constants/image_strings.dart';
import 'package:sohoj_kart/utils/constants/sizes.dart';
import 'package:sohoj_kart/utils/constants/text_strings.dart';
import 'package:sohoj_kart/utils/helpers/helper_functions.dart';

class SKLoginHeader extends StatelessWidget {
  const SKLoginHeader({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    final dark = SKHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: AssetImage(
            dark ? SKImages.lightAppLogo : SKImages.darkAppLogo,
          ),
          width: 150,
        ),
        Text(
          SKTexts.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: SKSizes.sm),
        Text(
          SKTexts.loginSubTitle,
          style: Theme.of(context).textTheme.bodyMedium,
        )
      ],
    );
  }
}