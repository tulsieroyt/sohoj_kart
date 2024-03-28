import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sohoj_kart/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:sohoj_kart/common/widgets/images/rounded_images.dart';
import 'package:sohoj_kart/common/widgets/products/product_icon/favourite_icon.dart';
import 'package:sohoj_kart/common/widgets/texts/product_price_text.dart';
import 'package:sohoj_kart/common/widgets/texts/product_title_text.dart';
import 'package:sohoj_kart/common/widgets/texts/sk_brand_title_with_verified_icon.dart';
import 'package:sohoj_kart/features/shop/controllers/product/product_controller.dart';
import 'package:sohoj_kart/features/shop/models/products/product_model.dart';
import 'package:sohoj_kart/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/enums.dart';
import '../../../../utils/constants/sizes.dart';

class SKProductCardHorizontal extends StatelessWidget {
  const SKProductCardHorizontal({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final darkMode = SKHelperFunctions.isDarkMode(context);

    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentages(product.price, product.salePrice);
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SKSizes.productItemRadius),
        color: darkMode ? SKColors.darkGrey : SKColors.softGrey,
      ),
      child: Row(
        children: [
          ///Thumbnail
          SKRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(SKSizes.sm),
            backgroundColor: darkMode ? SKColors.dark : SKColors.light,
            child: Stack(
              children: [
                ///Thumbnail Image
                SKRoundedImage(
                  width: 120,
                  height: 120,
                  imageUrl: product.thumbnail,
                  applyImageRadius: true,
                  isNetworkImage: true,
                  fit: BoxFit.contain,
                ),

                ///Sale tag
                if(salePercentage != null)
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

                /// Favourite Icon Button
                Positioned(
                  top: 0,
                  right: 0,
                  child: SKFavouriteIcon(productId: product.id)
                ),
              ],
            ),
          ),

          ///Details
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: SKSizes.sm, left: SKSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SKProductTitleText(
                        title: product.title,
                        isSmallText: true,
                      ),
                      const SizedBox(height: SKSizes.spaceBtwItems / 2),
                      SKBrandTitleWithVerifiedIcon(title: product.brand!.name)
                    ],
                  ),
                  const Spacer(),
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
                      Container(
                        decoration: const BoxDecoration(
                          color: SKColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(SKSizes.cardRadiusMd),
                            bottomRight: Radius.circular(SKSizes.productItemRadius),
                          ),
                        ),
                        child: const SizedBox(
                          height: SKSizes.lg * 1.2,
                          width: SKSizes.lg * 1.2,
                          child: Center(
                            child: Icon(
                              Iconsax.add,
                              color: SKColors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
