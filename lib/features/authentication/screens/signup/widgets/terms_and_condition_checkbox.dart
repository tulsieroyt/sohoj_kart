import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sohoj_kart/features/authentication/controllers/signup/signup_controller.dart';
import 'package:sohoj_kart/utils/constants/colors.dart';
import 'package:sohoj_kart/utils/constants/sizes.dart';
import 'package:sohoj_kart/utils/constants/text_strings.dart';
import 'package:sohoj_kart/utils/helpers/helper_functions.dart';

class SKTermsAndConditionCheckbox extends StatelessWidget {
  const SKTermsAndConditionCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    final dark = SKHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(
            () => Checkbox(
              value: controller.privacyPolicy.value,
              onChanged: (value) => controller.privacyPolicy.value =
                  !controller.privacyPolicy.value,
            ),
          ),
        ),
        const SizedBox(height: SKSizes.spaceBtwItems),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: ' ${SKTexts.iAgreeTo} ',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              TextSpan(
                text: SKTexts.privacyPolicy,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: dark ? Colors.white : SKColors.primary,
                      decoration: TextDecoration.underline,
                      decorationColor: dark ? Colors.white : SKColors.primary,
                    ),
              ),
              TextSpan(
                text: ' ${SKTexts.and} ',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              TextSpan(
                text: SKTexts.termsOfUse,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: dark ? Colors.white : SKColors.primary,
                      decoration: TextDecoration.underline,
                      decorationColor: dark ? Colors.white : SKColors.primary,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
