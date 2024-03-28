import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:sohoj_kart/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:sohoj_kart/common/widgets/products/rating/rating_indicator.dart';
import 'package:sohoj_kart/utils/constants/colors.dart';
import 'package:sohoj_kart/utils/constants/image_strings.dart';
import 'package:sohoj_kart/utils/constants/sizes.dart';
import 'package:sohoj_kart/utils/helpers/helper_functions.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = SKHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(SKImages.userImage),
                ),
                const SizedBox(width: SKSizes.spaceBtwItems),
                Text(
                  'Tulsie Chandra Barman',
                  style: Theme.of(context).textTheme.bodyMedium,
                )
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
          ],
        ),
        const SizedBox(height: SKSizes.spaceBtwItems),

        ///Review
        Row(
          children: [
            const SKRatingBarIndicator(rating: 4),
            const SizedBox(width: SKSizes.spaceBtwItems),
            Text('01 Mar, 2024', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: SKSizes.spaceBtwItems),
        const ReadMoreText(
          'The user interface of the app is quit intutive. I was able to navigate and make purches '
          'seamlessly. Great job!The user interface of the app is quit intutive. I was able to'
          ' navigate and make purches seamlessly. Great job!',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: 'Show More',
          trimCollapsedText: 'Show less',
          moreStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: SKColors.primary,
          ),
          lessStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: SKColors.primary,
          ),
        ),
        const SizedBox(height: SKSizes.spaceBtwItems),

        ///Company Review
        SKRoundedContainer(
          backgroundColor: darkMode ? SKColors.darkerGrey : SKColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(SKSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Sohoj Kart',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      '23 Mar 2024',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                const SizedBox(height: SKSizes.spaceBtwItems),
                const ReadMoreText(
                  'The user interface of the app is quit intutive. I was able to navigate and make purches '
                  'seamlessly. Great job!The user interface of the app is quit intutive. I was able to'
                  ' navigate and make purches seamlessly. Great job!',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: 'Show More',
                  trimCollapsedText: 'Show less',
                  moreStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: SKColors.primary,
                  ),
                  lessStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: SKColors.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: SKSizes.spaceBtwSections)
      ],
    );
  }
}
