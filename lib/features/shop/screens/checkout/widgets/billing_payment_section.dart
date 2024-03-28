import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/custom_shapes/container/rounded_container.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/checkout_controller.dart';

class SKBillingPaymentSection extends StatelessWidget {
  const SKBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CheckoutController());
    final darkMode = SKHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        SKSectionHeading(
          sectionText: 'Payment Method',
          buttonText: 'Change',
          onPressed: () => controller.selectPaymentMethod(context),
        ),
        const SizedBox(height: SKSizes.spaceBtwItems / 2),
        Obx(
          () => Row(
            children: [
              SKRoundedContainer(
                width: 60,
                height: 35,
                backgroundColor: darkMode ? SKColors.light : SKColors.white,
                child: Image(
                  image:
                      AssetImage(controller.selectedPaymentMethod.value.image),
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(width: SKSizes.spaceBtwItems / 2),
              Text(controller.selectedPaymentMethod.value.name,
                  style: Theme.of(context).textTheme.bodyLarge)
            ],
          ),
        )
      ],
    );
  }
}
