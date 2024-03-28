import 'package:flutter/material.dart';
import 'package:sohoj_kart/features/shop/models/cart_item_model.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../images/rounded_images.dart';
import '../../texts/product_title_text.dart';
import '../../texts/sk_brand_title_with_verified_icon.dart';

class SKCartItem extends StatelessWidget {
  const SKCartItem({
    super.key,
    required this.cartItem,
  });

  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ///Image
        SKRoundedImage(
          height: 60,
          width: 60,
          padding: const EdgeInsets.all(SKSizes.sm),
          imageUrl: cartItem.image ?? '',
          isNetworkImage: true,
          backgroundColor: SKHelperFunctions.isDarkMode(context)
              ? SKColors.darkerGrey
              : SKColors.light,
        ),
        const SizedBox(width: SKSizes.spaceBtwItems),

        ///Title Price & SIze
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SKBrandTitleWithVerifiedIcon(title: cartItem.brandName ?? ''),
              Flexible(
                child: SKProductTitleText(
                  title: cartItem.title,
                  maxLine: 1,
                ),
              ),
              Text.rich(
                TextSpan(
                    children: (cartItem.selectedVariation ?? {})
                        .entries
                        .map((e) => TextSpan(children: [
                              TextSpan(
                                text: e.key,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              TextSpan(
                                text: e.value,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ]))
                        .toList()),
              ),
            ],
          ),
        )
      ],
    );
  }
}
