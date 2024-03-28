import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sohoj_kart/common/widgets/layouts/grid_layout.dart';
import 'package:sohoj_kart/common/widgets/products/product_cards/product_cards_vertical.dart';
import 'package:sohoj_kart/common/widgets/texts/section_heading.dart';
import 'package:sohoj_kart/features/shop/controllers/category_controller.dart';
import 'package:sohoj_kart/features/shop/models/category_model.dart';
import 'package:sohoj_kart/features/shop/screens/all_products/all_products.dart';
import 'package:sohoj_kart/features/shop/screens/shop/widgets/category_brands.dart';
import 'package:sohoj_kart/utils/constants/sizes.dart';
import 'package:sohoj_kart/utils/helpers/cloud_helper_function.dart';
import 'package:sohoj_kart/utils/shimmer/vertical_product_shimmer.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(SKSizes.defaultSpace),
          child: Column(
            children: <Widget>[
              ///Brands
              CategoryBrands(category: category),
              const SizedBox(height: SKSizes.spaceBtwItems),


              ///Products
              FutureBuilder(
                  future:
                      controller.getCategoryProducts(categoryId: category.id),
                  builder: (context, snapshot) {
                    ///Helper function to Handler Loader, No Record or Error Message
                    final response =
                        SKCloudHelperFunctions.checkMultipleRecordState(
                            snapshot: snapshot,
                            loader: const SKVerticalProductShimmer());

                    if (response != null) return response;

                    final products = snapshot.data!;

                    return Column(
                      children: [
                        SKSectionHeading(
                          sectionText: 'You Might Like',
                          showButton: true,
                          onPressed: () => Get.to(
                            () => AllProductScreen(
                              title: category.name,
                              featuredMethod: controller.getCategoryProducts(
                                  categoryId: category.id, limit: -1),
                            ),
                          ),
                        ),
                        const SizedBox(height: SKSizes.spaceBtwItems),
                        SKGridLayout(
                          itemCount: products.length,
                          itemBuilder: (_, index) => SKProductCardVertical(
                            product: products[index],
                          ),
                        ),
                      ],
                    );
                  }),
            ],
          ),
        ),
      ],
    );
  }
}
