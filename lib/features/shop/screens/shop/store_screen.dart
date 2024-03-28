import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sohoj_kart/common/widgets/appbar/appbar.dart';
import 'package:sohoj_kart/common/widgets/appbar/tabbar.dart';
import 'package:sohoj_kart/common/widgets/custom_shapes/container/search_container.dart';
import 'package:sohoj_kart/common/widgets/layouts/grid_layout.dart';
import 'package:sohoj_kart/common/widgets/no_data/no_data_found_widget.dart';
import 'package:sohoj_kart/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:sohoj_kart/common/widgets/texts/section_heading.dart';
import 'package:sohoj_kart/common/widgets/brands/sk_brand_card.dart';
import 'package:sohoj_kart/features/shop/controllers/brand_controller.dart';
import 'package:sohoj_kart/features/shop/controllers/category_controller.dart';
import 'package:sohoj_kart/features/shop/screens/brand/all_brands.dart';
import 'package:sohoj_kart/features/shop/screens/brand/brand_products.dart';
import 'package:sohoj_kart/features/shop/screens/shop/widgets/category_tab.dart';
import 'package:sohoj_kart/utils/constants/colors.dart';
import 'package:sohoj_kart/utils/constants/sizes.dart';
import 'package:sohoj_kart/utils/helpers/helper_functions.dart';
import 'package:sohoj_kart/utils/shimmer/brand_shimmer.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = Get.put(BrandController());
    final categories = CategoryController.instance.featuredCategories;
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: SKAppBar(
          title:
              Text('Store', style: Theme.of(context).textTheme.headlineMedium),
          actions: const [SKCartCounterIcon()],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxScrollable) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: SKHelperFunctions.isDarkMode(context)
                    ? SKColors.black
                    : SKColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(SKSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      /// Search Bar
                      const SizedBox(height: SKSizes.spaceBtwItems),
                      const SKSearchContainer(
                        text: 'Search',
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(height: SKSizes.defaultSpace),

                      ///Featured Brands
                      SKSectionHeading(
                        sectionText: 'Featured Brands',
                        onPressed: () => Get.to(() => const AllBrandsScreen()),
                      ),
                      const SizedBox(height: SKSizes.defaultSpace / 1.5),
                      Obx(() {
                        if (brandController.isLoading.value) {
                          return const SKBrandShimmerEffect();
                        }

                        if (brandController.featuredBrands.isEmpty) {
                          return const SKNoDataFoundWidget();
                        }
                        return SKGridLayout(
                          itemCount: brandController.featuredBrands.length,
                          mainAxisExtent: 80,
                          itemBuilder: (_, index) {
                            final brand = brandController.featuredBrands[index];
                            return SKBrandCard(
                              showBorder: true,
                              brand: brand,
                              onTap: () =>
                                  Get.to(() => BrandProducts(brand: brand)),
                            );
                          },
                        );
                      })
                    ],
                  ),
                ),

                ///Tabs
                bottom: SKTabBar(
                    tabs: categories
                        .map((category) => Tab(child: Text(category.name)))
                        .toList()),
              ),
            ];
          },

          /// Body --
          body: TabBarView(
              children: categories
                  .map((category) => CategoryTab(category: category))
                  .toList()
              //CategoryTab(),
              ),
        ),
      ),
    );
  }
}
