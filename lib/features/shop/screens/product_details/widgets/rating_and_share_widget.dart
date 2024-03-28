import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';

class SKRatingAndShare extends StatelessWidget {
  const SKRatingAndShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ///Ratting
        Row(
          children: [
            const Icon(Iconsax.star5, color: Colors.amber, size: 25),
            const SizedBox(height: SKSizes.spaceBtwItems / 2),
            Text.rich(TextSpan(children: [
              TextSpan(
                text: '5.0',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const TextSpan(text: '(199)')
            ]))
          ],
        ),

        ///Share Button
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.share,
            size: SKSizes.iconMd,
          ),
        )
      ],
    );
  }
}
