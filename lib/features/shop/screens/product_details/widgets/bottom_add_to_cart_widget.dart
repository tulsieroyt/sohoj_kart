import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sohoj_kart/common/widgets/icon/sk_circular_icon.dart';
import 'package:sohoj_kart/features/shop/controllers/cart_controller.dart';
import 'package:sohoj_kart/features/shop/models/products/product_model.dart';
import 'package:sohoj_kart/utils/constants/colors.dart';
import 'package:sohoj_kart/utils/constants/sizes.dart';
import 'package:sohoj_kart/utils/helpers/helper_functions.dart';

class SkBottomAddToCart extends StatelessWidget {
  const SkBottomAddToCart({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    controller.updateAlreadyAddedProductCount(product);
    final darkMode = SKHelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: SKSizes.defaultSpace,
        vertical: SKSizes.defaultSpace / 2,
      ),
      decoration: BoxDecoration(
        color: darkMode ? SKColors.darkerGrey : SKColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(SKSizes.cardRadiusLg),
          topRight: Radius.circular(SKSizes.cardRadiusLg),
        ),
      ),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SKCircularIcon(
                  icon: Iconsax.minus,
                  backgroundColor: SKColors.darkGrey,
                  width: 40,
                  height: 40,
                  color: SKColors.white,
                  onPressed: () => controller.productQuantityInCart.value < 1
                      ? null
                      : controller.productQuantityInCart.value -= 1,
                ),
                const SizedBox(width: SKSizes.spaceBtwItems),
                Text(
                  controller.productQuantityInCart.value.toString(),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(width: SKSizes.spaceBtwItems),
                SKCircularIcon(
                  icon: Iconsax.add,
                  backgroundColor: SKColors.black,
                  width: 40,
                  height: 40,
                  color: SKColors.white,
                  onPressed: () => controller.productQuantityInCart.value += 1,
                ),
              ],
            ),
            ElevatedButton(
              onPressed: controller.productQuantityInCart.value < 1
                  ? null
                  : () => controller.addToCart(product),
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(SKSizes.md),
                  backgroundColor: SKColors.black,
                  side: const BorderSide(color: SKColors.black)),
              child: controller.productQuantityInCart.value < 1
                  ? const Text(
                      'Add to Cart',
                      style: TextStyle(color: Colors.black38),
                    )
                  : const Text('Add to Cart'),
            )
          ],
        ),
      ),
    );
  }
}
