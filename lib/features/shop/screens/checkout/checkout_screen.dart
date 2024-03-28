import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sohoj_kart/common/widgets/appbar/appbar.dart';
import 'package:sohoj_kart/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:sohoj_kart/common/widgets/success_screen/success_screen.dart';
import 'package:sohoj_kart/features/shop/controllers/cart_controller.dart';
import 'package:sohoj_kart/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:sohoj_kart/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:sohoj_kart/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:sohoj_kart/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:sohoj_kart/navigation_menu.dart';
import 'package:sohoj_kart/utils/constants/colors.dart';
import 'package:sohoj_kart/utils/constants/image_strings.dart';
import 'package:sohoj_kart/utils/constants/sizes.dart';
import 'package:sohoj_kart/utils/helpers/helper_functions.dart';
import 'package:sohoj_kart/utils/helpers/pricing_calculator.dart';
import 'package:sohoj_kart/utils/popups/loaders.dart';

import '../../../../common/widgets/products/cart/coupon_widget.dart';
import '../../controllers/order_controller.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final subTotal = cartController.totalCartPrice.value;
    final orderController = Get.put(OrderController());
    final totalAmount = SKPricingCalculator.calculateTotalPrice(subTotal, 'US');
    final darkMode = SKHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: SKAppBar(
        showBackArrow: true,
        title: Text(
          'Order Review',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SKSizes.defaultSpace),
          child: Column(
            children: [
              const SKCartItems(showAddRemoveButton: false),
              const SizedBox(height: SKSizes.spaceBtwSections),

              ///Coupon TextField
              const SKCouponCode(),
              const SizedBox(height: SKSizes.spaceBtwSections),

              ///Billing Section
              SKRoundedContainer(
                padding: const EdgeInsets.all(SKSizes.defaultSpace),
                showBorder: true,
                backgroundColor: darkMode ? SKColors.black : SKColors.white,
                child: const Column(
                  children: [
                    ///Pricing
                    SKBillingAmountSection(),
                    SizedBox(height: SKSizes.spaceBtwItems),

                    ///Divider
                    Divider(),
                    SizedBox(height: SKSizes.spaceBtwItems),

                    ///Payment Method
                    SKBillingPaymentSection(),
                    SizedBox(height: SKSizes.spaceBtwItems),

                    ///Address
                    SKBillingAddressSection(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(SKSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: subTotal > 0
              ? () => orderController.processOrder(totalAmount)
              : () => SKLoaders.warningSnackBar(
                  title: 'Empty Cart',
                  message: 'Add items tn the cart in order to proceed'),
          child: Text('Checkout \$$totalAmount'),
        ),
      ),
    );
  }
}
