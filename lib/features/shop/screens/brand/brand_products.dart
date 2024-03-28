import 'package:flutter/material.dart';
import 'package:sohoj_kart/common/widgets/brands/sk_brand_card.dart';
import 'package:sohoj_kart/common/widgets/products/sortable/sortable_products.dart';
import 'package:sohoj_kart/features/shop/controllers/brand_controller.dart';
import 'package:sohoj_kart/features/shop/models/products/brand_model.dart';
import 'package:sohoj_kart/utils/constants/sizes.dart';
import 'package:sohoj_kart/utils/helpers/cloud_helper_function.dart';
import 'package:sohoj_kart/utils/shimmer/vertical_product_shimmer.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brand});

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: AppBar(
        title: Text(brand.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SKSizes.defaultSpace),
          child: Column(
            children: [
              ///Brand Details
              SKBrandCard(showBorder: true, brand: brand),
              const SizedBox(height: SKSizes.spaceBtwSections),

              ///
              FutureBuilder(
                  future: controller.getBrandProducts(brandId: brand.id),
                  builder: (context, snapshot) {
                    //Handle Loader , No Record or Error Message
                    const loader = SKVerticalProductShimmer();
                    final widget =
                        SKCloudHelperFunctions.checkMultipleRecordState(
                            snapshot: snapshot, loader: loader);

                    if (widget != null) return widget;

                    final brandProducts = snapshot.data!;

                    return SkSortableProducts(products: brandProducts);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
