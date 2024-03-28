import 'package:flutter/material.dart';
import 'package:sohoj_kart/common/widgets/appbar/appbar.dart';
import 'package:sohoj_kart/features/shop/screens/product_reviews/widgets/overall_product_rating.dart';
import 'package:sohoj_kart/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:sohoj_kart/utils/constants/sizes.dart';

import '../../../../common/widgets/products/rating/rating_indicator.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SKAppBar(
        title: Text('Reviews & Ratings'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: SKSizes.defaultSpace,
            right: SKSizes.defaultSpace,
            bottom: SKSizes.defaultSpace,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Rating and Reviews are verified and are from the people who use the same type of device that you use',
              ),
              const SizedBox(height: SKSizes.spaceBtwItems),

              ///Overall Product Ratings
              const SKOverallProductRating(),
              const SKRatingBarIndicator(rating: 4.0),
              Text('12,611', style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: SKSizes.spaceBtwSections),

              ///User Review List
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
