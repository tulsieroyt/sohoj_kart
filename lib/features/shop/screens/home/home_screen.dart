import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sohoj_kart/common/widgets/layouts/grid_layout.dart';
import 'package:sohoj_kart/common/widgets/products/product_cards/product_cards_vertical.dart';
import 'package:sohoj_kart/common/widgets/texts/section_heading.dart';
import 'package:sohoj_kart/features/shop/controllers/product/product_controller.dart';
import 'package:sohoj_kart/features/shop/screens/all_products/all_products.dart';
import 'package:sohoj_kart/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:sohoj_kart/common/widgets/custom_shapes/container/primary_header_container.dart';
import 'package:sohoj_kart/common/widgets/custom_shapes/container/search_container.dart';
import 'package:sohoj_kart/features/shop/screens/home/widgets/home_categories.dart';
import 'package:sohoj_kart/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:sohoj_kart/utils/constants/sizes.dart';
import 'package:sohoj_kart/utils/shimmer/vertical_product_shimmer.dart';

import '../../../../common/widgets/no_data/no_data_found_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SKPrimaryHeaderContainer(
              child: Column(
                children: [
                  ///App Bar
                  SKHomeAppBar(),
                  SizedBox(height: SKSizes.spaceBtwSections),

                  ///Search Bar
                  SKSearchContainer(text: 'Search in Store'),
                  SizedBox(height: SKSizes.spaceBtwSections),

                  Padding(
                    padding: EdgeInsets.only(left: SKSizes.defaultSpace),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SKSectionHeading(
                          sectionText: 'Popular Category',
                          showButton: false,
                        ),
                        SizedBox(height: SKSizes.spaceBtwItems),

                        ///Category
                        SKHomeCategories(),
                      ],
                    ),
                  ),

                  SizedBox(height: SKSizes.spaceBtwSections)
                ],
              ),
            ),

            ///Body
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: SKSizes.defaultSpace),
              child: Column(
                children: [
                  const SKPromoSlider(),
                  const SizedBox(height: SKSizes.spaceBtwSections),
                  SKSectionHeading(
                    sectionText: 'Popular Products',
                    onPressed: () => Get.to(() => AllProductScreen(
                        title: 'Popular Products',
                        featuredMethod: controller.fetchAllFeaturedProducts())),
                  ),
                  const SizedBox(height: SKSizes.spaceBtwItems),
                  Obx(() {
                    if (controller.isLoading.value) {
                      return const SKVerticalProductShimmer();
                    }
                    if (controller.featuredProducts.isEmpty) {
                      return const SKNoDataFoundWidget();
                    }
                    return SKGridLayout(
                      itemCount: controller.featuredProducts.length,
                      itemBuilder: (_, index) {
                        return SKProductCardVertical(
                          product: controller.featuredProducts[index],
                        );
                      },
                    );
                  }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
