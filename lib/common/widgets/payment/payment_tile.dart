import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sohoj_kart/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:sohoj_kart/features/shop/controllers/checkout_controller.dart';
import 'package:sohoj_kart/features/shop/models/payment_method_model.dart';
import 'package:sohoj_kart/utils/constants/colors.dart';
import 'package:sohoj_kart/utils/helpers/helper_functions.dart';

class SKPaymentTile extends StatelessWidget {
  const SKPaymentTile({super.key, required this.paymentMethod});

  final PaymentMethodModel paymentMethod;

  @override
  Widget build(BuildContext context) {
    final controller = CheckoutController.instance;
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      onTap: () {
        controller.selectedPaymentMethod.value = paymentMethod;
        Get.back();
      },
      leading: SKRoundedContainer(
        width: 60,
        height: 60,
        backgroundColor: SKHelperFunctions.isDarkMode(context)
            ? SKColors.light
            : SKColors.white,
        child:
            Image(image: AssetImage(paymentMethod.image), fit: BoxFit.contain),
      ),
      title: Text(paymentMethod.name),
      trailing: const Icon(Iconsax.arrow_right_34),
    );
  }
}
