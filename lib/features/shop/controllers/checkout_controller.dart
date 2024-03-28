import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sohoj_kart/common/widgets/payment/payment_tile.dart';
import 'package:sohoj_kart/common/widgets/texts/section_heading.dart';
import 'package:sohoj_kart/features/shop/models/payment_method_model.dart';
import 'package:sohoj_kart/utils/constants/image_strings.dart';
import 'package:sohoj_kart/utils/constants/sizes.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  final Rx<PaymentMethodModel> selectedPaymentMethod =
      PaymentMethodModel.empty().obs;

  @override
  void onInit() {
    selectedPaymentMethod.value =
        PaymentMethodModel(image: 'Paypal', name: SKImages.paypalIcon);
    super.onInit();
  }

  Future<dynamic> selectPaymentMethod(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (_) => SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(SKSizes.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SKSectionHeading(
                sectionText: 'Select Payment Method',
                showButton: false,
              ),
              const SizedBox(height: SKSizes.spaceBtwSections),
              SKPaymentTile(
                paymentMethod: PaymentMethodModel(
                    image: SKImages.paypalIcon, name: 'Paypal'),
              ),
              const SizedBox(height: SKSizes.spaceBtwSections / 2),
              SKPaymentTile(
                paymentMethod: PaymentMethodModel(
                    image: SKImages.paypalIcon, name: 'Google Pay'),
              ),
              const SizedBox(height: SKSizes.spaceBtwSections / 2),
              SKPaymentTile(
                paymentMethod: PaymentMethodModel(
                    image: SKImages.paypalIcon, name: 'Apple Pay'),
              ),
              const SizedBox(height: SKSizes.spaceBtwSections / 2),
              SKPaymentTile(
                paymentMethod: PaymentMethodModel(
                    image: SKImages.paypalIcon, name: 'VISA'),
              ),
              const SizedBox(height: SKSizes.spaceBtwSections / 2),
              SKPaymentTile(
                paymentMethod: PaymentMethodModel(
                    image: SKImages.paypalIcon, name: 'MasterCard'),
              ),
              const SizedBox(height: SKSizes.spaceBtwSections / 2),
              SKPaymentTile(
                paymentMethod: PaymentMethodModel(
                    image: SKImages.paypalIcon, name: 'Paytm'),
              ),
              const SizedBox(height: SKSizes.spaceBtwSections / 2),
              SKPaymentTile(
                paymentMethod: PaymentMethodModel(
                    image: SKImages.paypalIcon, name: 'Credit Card'),
              ),
              const SizedBox(height: SKSizes.spaceBtwSections),
            ],
          ),
        ),
      ),
    );
  }
}
