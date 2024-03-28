import 'package:flutter/material.dart';
import 'package:sohoj_kart/common/styles/spacing_styles.dart';
import 'package:sohoj_kart/utils/constants/sizes.dart';
import 'package:sohoj_kart/utils/constants/text_strings.dart';
import 'package:sohoj_kart/utils/helpers/helper_functions.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    this.onPressed,
  });

  final String image, title, subtitle;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: SKSpacingStyle.paddingWithAppBarHeight * 2,
        child: Column(
          children: [
            Center(
              child: Image(
                image: AssetImage(image),
                width: SKHelperFunctions.screenWidth() * 0.2,
              ),
            ),
            const SizedBox(height: SKSizes.spaceBtwSections),

            ///Title and Subtitle
            Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: SKSizes.spaceBtwSections),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.labelLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: SKSizes.spaceBtwSections),

            ///Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onPressed,
                child: const Text(SKTexts.skContinue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
