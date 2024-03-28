import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sohoj_kart/features/shop/controllers/cart_controller.dart';
import 'package:sohoj_kart/features/shop/screens/product_details/product_detail_screen.dart';
import 'package:sohoj_kart/utils/constants/enums.dart';

import '../../../../features/shop/models/products/product_model.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class ProductCardAddToCartButton extends StatelessWidget {
  const ProductCardAddToCartButton({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return InkWell(
      onTap: () {
        //If the product have variations then show the product Details of variation selection
        //Else add product to the cart

        if (product.productType == ProductType.single.toString()) {
          final cartItem = cartController.convertToCartItem(product, 1);
          cartController.addOneItemToCart(cartItem);
        } else {
          Get.to(() => ProductDetailScreen(product: product));
        }
      },
      child: Obx(() {
        final productQuantityInCart =
            cartController.getProductQuantityInCart(product.id);
        return Container(
          decoration: BoxDecoration(
            color: productQuantityInCart > 0 ? SKColors.primary : SKColors.dark,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(SKSizes.cardRadiusMd),
              bottomRight: Radius.circular(SKSizes.productItemRadius),
            ),
          ),
          child: SizedBox(
            height: SKSizes.lg * 1.2,
            width: SKSizes.lg * 1.2,
            child: Center(
              child: productQuantityInCart > 0
                  ? Text(
                      productQuantityInCart.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .apply(color: SKColors.white),
                    )
                  : const Icon(
                      Iconsax.add,
                      color: SKColors.white,
                    ),
            ),
          ),
        );
      }),
    );
  }
}
