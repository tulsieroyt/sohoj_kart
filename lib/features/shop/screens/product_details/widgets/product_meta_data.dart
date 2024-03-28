import 'package:flutter/material.dart';
import 'package:sohoj_kart/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:sohoj_kart/common/widgets/images/circular_images.dart';
import 'package:sohoj_kart/common/widgets/texts/product_price_text.dart';
import 'package:sohoj_kart/common/widgets/texts/product_title_text.dart';
import 'package:sohoj_kart/common/widgets/texts/sk_brand_title_with_verified_icon.dart';
import 'package:sohoj_kart/features/shop/controllers/product/product_controller.dart';
import 'package:sohoj_kart/utils/constants/colors.dart';
import 'package:sohoj_kart/utils/constants/enums.dart';
import 'package:sohoj_kart/utils/constants/sizes.dart';
import 'package:sohoj_kart/utils/helpers/helper_functions.dart';

import '../../../models/products/product_model.dart';

class SKProductMetaData extends StatelessWidget {
  const SKProductMetaData({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentages(product.price, product.salePrice);
    final darkMode = SKHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price and Sale Price
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ///Sale Tag
            SKRoundedContainer(
              radius: SKSizes.sm,
              backgroundColor: SKColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: SKSizes.sm, vertical: SKSizes.xs),
              child: Text(
                '$salePercentage%',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: SKColors.black),
              ),
            ),
            const SizedBox(height: SKSizes.spaceBtwItems),

            ///Price
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              Text(
                '\$${product.price}',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .apply(decoration: TextDecoration.lineThrough),
              ),
            const SizedBox(width: SKSizes.spaceBtwItems),
            SKProductPriceText(
              price: controller.getProductPrice(product),
              isLarge: true,
            )
          ],
        ),
        const SizedBox(height: SKSizes.spaceBtwItems / 1.5),

        /// Title
        SKProductTitleText(
          title: product.title,
          isSmallText: false,
        ),
        const SizedBox(height: SKSizes.spaceBtwItems / 1.5),

        ///Stock Status
        Row(
          children: [
            const SKProductTitleText(title: 'Status'),
            const SizedBox(width: SKSizes.spaceBtwItems),
            Text(controller.getProductStockStatus(product.stock),
                style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: SKSizes.spaceBtwItems / 1.5),

        Row(
          children: [
            SKCircularImage(
              height: 32,
              width: 32,
              image: product.brand != null ? product.brand!.image : '',
              isNetworkImage: true,
              overlayColor: darkMode ? SKColors.white : SKColors.black,
            ),
            const SizedBox(width: 8),
            SKBrandTitleWithVerifiedIcon(
                title: product.brand != null ? product.brand!.name : '')
          ],
        )

        /// Brand
      ],
    );
  }
}
