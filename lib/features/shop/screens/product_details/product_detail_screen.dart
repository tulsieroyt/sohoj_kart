import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sohoj_kart/common/widgets/texts/section_heading.dart';
import 'package:sohoj_kart/features/shop/models/products/product_model.dart';
import 'package:sohoj_kart/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:sohoj_kart/features/shop/screens/product_details/widgets/product_attribute.dart';
import 'package:sohoj_kart/features/shop/screens/product_details/widgets/product_details_image_slider.dart';
import 'package:sohoj_kart/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:sohoj_kart/features/shop/screens/product_details/widgets/rating_and_share_widget.dart';
import 'package:sohoj_kart/features/shop/screens/product_reviews/product_reviews_screen.dart';
import 'package:sohoj_kart/utils/constants/enums.dart';
import 'package:sohoj_kart/utils/constants/sizes.dart';
import 'package:readmore/readmore.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SkBottomAddToCart(product: product),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///Product Image Slider

            SKProductDetailsImageSlider(product: product),

            ///Product Details
            Padding(
              padding: const EdgeInsets.only(
                right: SKSizes.defaultSpace,
                left: SKSizes.defaultSpace,
                bottom: SKSizes.defaultSpace,
              ),
              child: Column(
                children: <Widget>[
                  ///Rating and share
                  const SKRatingAndShare(),

                  ///Price title Stock and Brand
                  SKProductMetaData(product: product),

                  ///Attributes
                  if (product.productType == ProductType.variable.toString())
                    ProductAttributes(product: product),
                  if (product.productType == ProductType.variable.toString())
                    const SizedBox(height: SKSizes.spaceBtwSections),

                  ///Checkout Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Checkout'),
                    ),
                  ),
                  const SizedBox(height: SKSizes.spaceBtwItems),

                  ///Description
                  const SKSectionHeading(
                    sectionText: 'Description',
                    showButton: false,
                  ),
                  const SizedBox(height: SKSizes.spaceBtwItems),
                  ReadMoreText(
                    product.description ?? '',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'less',
                    moreStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: Colors.blue,
                    ),
                    lessStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: Colors.blue,
                    ),
                  ),

                  ///Review
                  const SizedBox(height: SKSizes.spaceBtwItems),
                  const Divider(),
                  const SizedBox(height: SKSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SKSectionHeading(
                        sectionText: 'Reviews(199)',
                        showButton: false,
                      ),
                      IconButton(
                        onPressed: () {
                          Get.to(() => const ProductReviewsScreen());
                        },
                        icon: const Icon(
                          Iconsax.arrow_right_3,
                          size: 18,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: SKSizes.spaceBtwItems)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
