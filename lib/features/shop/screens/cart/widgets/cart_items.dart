import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sohoj_kart/features/shop/controllers/cart_controller.dart';

import '../../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../utils/constants/sizes.dart';

class SKCartItems extends StatelessWidget {
  const SKCartItems({
    super.key,
    this.showAddRemoveButton = true,
  });

  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return Obx(
      () => ListView.separated(
        shrinkWrap: true,
        itemCount: cartController.cartItems.length,
        itemBuilder: (_, index) => Obx(() {
          final item = cartController.cartItems[index];
          return Column(
            children: [
              SKCartItem(cartItem: item),
              if (showAddRemoveButton)
                const SizedBox(height: SKSizes.spaceBtwItems),
              if (showAddRemoveButton)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 70),

                        ///Add Remove Button
                        SKProductQuantityWithAddOrRemoveButton(
                          quantity: item.quantity,
                          add: () => cartController.addOneItemToCart(item),
                          remove: () =>
                              cartController.removeOneItemFromTheCart(item),
                        ),
                      ],
                    ),

                    ///Price Text
                    SKProductPriceText(
                        price: (item.price * item.quantity).toStringAsFixed(1))
                  ],
                )
            ],
          );
        }),
        separatorBuilder: (_, __) =>
            const SizedBox(height: SKSizes.spaceBtwSections),
      ),
    );
  }
}
