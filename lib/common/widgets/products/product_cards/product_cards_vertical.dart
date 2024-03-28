import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sohoj_kart/common/styles/shadows.dart';
import 'package:sohoj_kart/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:sohoj_kart/common/widgets/images/rounded_images.dart';
import 'package:sohoj_kart/common/widgets/products/product_icon/favourite_icon.dart';
import 'package:sohoj_kart/common/widgets/texts/product_title_text.dart';
import 'package:sohoj_kart/common/widgets/texts/sk_brand_title_with_verified_icon.dart';
import 'package:sohoj_kart/features/shop/controllers/product/product_controller.dart';
import 'package:sohoj_kart/features/shop/models/products/product_model.dart';
import 'package:sohoj_kart/features/shop/screens/product_details/product_detail_screen.dart';
import 'package:sohoj_kart/utils/constants/colors.dart';
import 'package:sohoj_kart/utils/constants/enums.dart';
import 'package:sohoj_kart/utils/constants/sizes.dart';
import 'package:sohoj_kart/utils/helpers/helper_functions.dart';

import '../../texts/product_price_text.dart';
import '../cart/add_to_cart_button.dart';

class SKProductCardVertical extends StatelessWidget {
  const SKProductCardVertical({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentages(product.price, product.salePrice);
    final darkMode = SKHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(product: product)),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [SKShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(SKSizes.productItemRadius),
          color: darkMode ? SKColors.darkGrey : SKColors.white,
        ),
        child: Column(
          children: [
            SKRoundedContainer(
              width: 180,
              height: 180,
              padding: const EdgeInsets.all(SKSizes.sm),
              backgroundColor: darkMode ? SKColors.dark : SKColors.light,
              child: Stack(
                children: [
                  /// --- Thumbnail Image
                  Center(
                    child: SKRoundedImage(
                      imageUrl: product.thumbnail,
                      applyImageRadius: true,
                      isNetworkImage: true,
                    ),
                  ),

                  ///Set Tag
                  if (salePercentage != null)
                    Positioned(
                      top: 12,
                      child: SKRoundedContainer(
                        radius: SKSizes.sm,
                        backgroundColor: SKColors.secondary.withOpacity(0.8),
                        padding: const EdgeInsets.symmetric(
                          horizontal: SKSizes.sm,
                          vertical: SKSizes.xs,
                        ),
                        child: Text(
                          '$salePercentage%',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .apply(color: SKColors.black),
                        ),
                      ),
                    ),

                  /// --- Favourite Icon Button for wishlist
                  Positioned(
                    top: 0,
                    right: 0,
                    child: SKFavouriteIcon(productId: product.id),
                  )
                ],
              ),
            ),
            const SizedBox(height: SKSizes.spaceBtwItems / 2),

            //Details and Price
            Padding(
              padding: const EdgeInsets.only(left: SKSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SKProductTitleText(
                    title: product.title,
                    isSmallText: true,
                  ),
                  const SizedBox(height: SKSizes.spaceBtwItems / 2),
                  SKBrandTitleWithVerifiedIcon(title: product.brand!.name),
                ],
              ),
            ),
            const Spacer(),

            ///Price Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///Price
                Flexible(
                  child: Column(
                    children: [
                      if (product.productType ==
                              ProductType.single.toString() &&
                          product.salePrice > 0)
                        Padding(
                          padding: const EdgeInsets.only(left: SKSizes.sm),
                          child: Text(
                            product.price.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                        ),

                      ///Price, Show sale price as main price id sale exist
                      Padding(
                        padding: const EdgeInsets.only(left: SKSizes.sm),
                        child: SKProductPriceText(
                            price: controller.getProductPrice(product),
                            isLarge: true),
                      ),
                    ],
                  ),
                ),

                ///Add to cart button
                ProductCardAddToCartButton( product: product)
              ],
            )
          ],
        ),
      ),
    );
  }
}

