import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sohoj_kart/common/widgets/appbar/appbar.dart';
import 'package:sohoj_kart/common/widgets/brands/sk_brand_card.dart';
import 'package:sohoj_kart/common/widgets/layouts/grid_layout.dart';
import 'package:sohoj_kart/common/widgets/no_data/no_data_found_widget.dart';
import 'package:sohoj_kart/common/widgets/texts/section_heading.dart';
import 'package:sohoj_kart/features/shop/controllers/brand_controller.dart';
import 'package:sohoj_kart/features/shop/screens/brand/brand_products.dart';
import 'package:sohoj_kart/utils/constants/sizes.dart';
import 'package:sohoj_kart/utils/shimmer/brand_shimmer.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;
    return Scaffold(
      appBar: const SKAppBar(
        title: Text('Brand'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SKSizes.defaultSpace),
          child: Column(
            children: [
              ///Heading
              const SKSectionHeading(sectionText: 'Brands', showButton: false),
              const SizedBox(height: SKSizes.spaceBtwItems),

              ///Brands
              Obx(() {
                if (brandController.isLoading.value) {
                  return const SKBrandShimmerEffect();
                }

                if (brandController.featuredBrands.isEmpty) {
                  return const SKNoDataFoundWidget();
                }
                return SKGridLayout(
                    itemCount: brandController.allBrands.length,
                    mainAxisExtent: 80,
                    itemBuilder: (context, index) {
                      final brand = brandController.allBrands[index];
                      if (kDebugMode) {
                        print('index $index link  ${brand.image}');
                      }

                      return SKBrandCard(
                        brand: brand,
                        showBorder: true,
                        onTap: () => Get.to(() => BrandProducts(brand: brand)),
                      );
                    });
              })
            ],
          ),
        ),
      ),
    );
  }
}
