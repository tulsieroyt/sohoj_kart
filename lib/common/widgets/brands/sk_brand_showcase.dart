import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sohoj_kart/common/widgets/brands/sk_brand_card.dart';
import 'package:sohoj_kart/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:sohoj_kart/features/shop/models/products/brand_model.dart';
import 'package:sohoj_kart/features/shop/screens/brand/brand_products.dart';
import 'package:sohoj_kart/utils/constants/colors.dart';
import 'package:sohoj_kart/utils/constants/sizes.dart';
import 'package:sohoj_kart/utils/helpers/helper_functions.dart';
import 'package:sohoj_kart/utils/shimmer/shimmer_effect.dart';

class SKBrandShowcase extends StatelessWidget {
  const SKBrandShowcase({
    super.key,
    required this.images,
    required this.brand,
  });

  final BrandModel brand;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => BrandProducts(brand: brand)),
      child: SKRoundedContainer(
        showBorder: true,
        borderColor: SKColors.darkGrey,
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(SKSizes.md),
        margin: const EdgeInsets.only(bottom: SKSizes.defaultSpace),
        child: Column(
          children: [
            ///Brand with Product Card
            SKBrandCard(showBorder: false, brand: brand),

            ///Brand top 3 Products
            Row(
              children: images
                  .map((image) => brandTopProductImageWidget(image, context))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context) {
    return Expanded(
      child: SKRoundedContainer(
        height: 100,
        backgroundColor: SKHelperFunctions.isDarkMode(context)
            ? SKColors.darkGrey
            : SKColors.white,
        margin: const EdgeInsets.only(right: SKSizes.sm),
        padding: const EdgeInsets.all(SKSizes.md),
        child: CachedNetworkImage(
          fit: BoxFit.contain,
          imageUrl: image,
          progressIndicatorBuilder: (_, __, ___) =>
              const SKShimmerEffect(height: 100, width: 100),
          errorWidget: (_, __, ___) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
