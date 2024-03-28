import 'package:flutter/material.dart';
import 'package:sohoj_kart/features/shop/controllers/cart_controller.dart';
import 'package:sohoj_kart/utils/helpers/pricing_calculator.dart';

import '../../../../../utils/constants/sizes.dart';

class SKBillingAmountSection extends StatelessWidget {
  const SKBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final subTotal = cartController.totalCartPrice.value;

    return Column(
      children: [
        ///Sub Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Subtotal:',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text('\$$subTotal :',
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: SKSizes.spaceBtwItems / 2),

        ///Shipping Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Shipping Fee:',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
                '\$${SKPricingCalculator.calculateShippingCost(subTotal, 'US')} :',
                style: Theme.of(context).textTheme.labelLarge),
          ],
        ),

        const SizedBox(height: SKSizes.spaceBtwItems / 2),

        ///Tax Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Tax Fee:',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
                '\$${SKPricingCalculator.calculateTax(subTotal, 'US')} :',
                style: Theme.of(context).textTheme.labelLarge),
          ],
        ),

        const SizedBox(height: SKSizes.spaceBtwItems / 2),

        ///Order Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Order Total',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text('\$${SKPricingCalculator.calculateTotalPrice(subTotal, 'US')} :', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ],
    );
  }
}
