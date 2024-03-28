import 'package:flutter/material.dart';
import 'package:sohoj_kart/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:sohoj_kart/common/widgets/images/circular_images.dart';
import 'package:sohoj_kart/common/widgets/texts/sk_brand_title_with_verified_icon_for_brands.dart';
import 'package:sohoj_kart/features/shop/models/products/brand_model.dart';
import 'package:sohoj_kart/utils/constants/enums.dart';
import 'package:sohoj_kart/utils/constants/sizes.dart';

class SKBrandCard extends StatelessWidget {
  const SKBrandCard({
    super.key,
    this.showBorder = false,
    this.onTap,
    required this.brand,
  });

  final BrandModel brand;
  final bool showBorder;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SKRoundedContainer(
        padding: const EdgeInsets.all(SKSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            ///  Container
            SKCircularImage(
              fit: BoxFit.fill,
              isNetworkImage: true,
              image: brand.image,
              backgroundColor: Colors.transparent,
            ),
            const SizedBox(height: SKSizes.spaceBtwItems / 2),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text('Nike')
                  SKBrandTitleWithVerifiedIconForBrands(
                    title: brand.name,
                    brandTextSize: TextSizes.large,
                  ),
                  Text(
                    '${brand.productsCount ?? 0} products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelLarge,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
