import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sohoj_kart/common/widgets/appbar/appbar.dart';
import 'package:sohoj_kart/common/widgets/products/product_cards/product_cards_horizontal.dart';
import 'package:sohoj_kart/common/widgets/texts/section_heading.dart';
import 'package:sohoj_kart/features/shop/controllers/category_controller.dart';
import 'package:sohoj_kart/features/shop/models/category_model.dart';
import 'package:sohoj_kart/features/shop/screens/all_products/all_products.dart';
import 'package:sohoj_kart/features/shop/screens/product_details/product_detail_screen.dart';
import 'package:sohoj_kart/utils/constants/sizes.dart';
import 'package:sohoj_kart/utils/helpers/cloud_helper_function.dart';
import 'package:sohoj_kart/utils/shimmer/horizontal_product_shimmer.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return Scaffold(
      appBar: SKAppBar(
        showBackArrow: true,
        title: Text(category.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SKSizes.defaultSpace),
          child: Column(
            children: [
              ///Banner
              // const SKRoundedImage(
              //   width: double.infinity,
              //   imageUrl: SKImages.gadgetBanner,
              //   height: null,
              //   applyImageRadius: true,
              // ),
              const SizedBox(height: SKSizes.spaceBtwSections),

              ///Sub Category
              FutureBuilder(
                  future: controller.getSubCategories(categoryId: category.id),
                  builder: (context, snapshot) {
                    ///Handle Loader, No Records Or Error Message
                    const loader = SKHorizontalProductShimmerEffect();
                    final widget =
                        SKCloudHelperFunctions.checkMultipleRecordState(
                            snapshot: snapshot, loader: loader);

                    if (widget != null) return widget;

                    ///Record Found
                    final subCategories = snapshot.data!;

                    if (subCategories.isEmpty) {
                      return const Center(child: Text('No Data Found'));
                    }

                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: subCategories.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (_, index) {
                          final subCategory = subCategories[index];
                          return FutureBuilder(
                              future: controller.getCategoryProducts(
                                  categoryId: subCategory.id),
                              builder: (context, snapshot) {
                                ///Handle Loader, No Records Or Error Message
                                final widget = SKCloudHelperFunctions
                                    .checkMultipleRecordState(
                                        snapshot: snapshot, loader: loader);

                                if (widget != null) return widget;

                                ///Record Found
                                final products = snapshot.data!;

                                return Column(
                                  children: [
                                    ///Heading
                                    SKSectionHeading(
                                      sectionText: subCategory.name,
                                      onPressed: () => Get.to(
                                        () => AllProductScreen(
                                          title: subCategory.name,
                                          featuredMethod:
                                              controller.getCategoryProducts(
                                                  categoryId: subCategory.id,
                                                  limit: -1),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                        height: SKSizes.spaceBtwItems / 2),

                                    SizedBox(
                                      height: 120,
                                      child: ListView.separated(
                                        itemCount: products.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) =>
                                            InkWell(
                                              child: SKProductCardHorizontal(
                                                  product: products[index]),
                                              onTap: (){
                                                Get.to(ProductDetailScreen(product: products[index]));
                                              },
                                            ),
                                        separatorBuilder: (_, __) =>
                                            const SizedBox(
                                          width: SKSizes.spaceBtwItems,
                                        ),
                                      ),
                                    ),

                                    const SizedBox(
                                        height: SKSizes.spaceBtwSections)
                                  ],
                                );
                              });
                        });
                  })
            ],
          ),
        ),
      ),
    );
  }
}
