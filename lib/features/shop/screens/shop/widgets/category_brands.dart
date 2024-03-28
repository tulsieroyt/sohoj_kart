import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sohoj_kart/common/widgets/brands/sk_brand_showcase.dart';
import 'package:sohoj_kart/features/shop/controllers/brand_controller.dart';
import 'package:sohoj_kart/features/shop/models/category_model.dart';
import 'package:sohoj_kart/utils/constants/sizes.dart';
import 'package:sohoj_kart/utils/helpers/cloud_helper_function.dart';
import 'package:sohoj_kart/utils/shimmer/box_shimmer.dart';
import 'package:sohoj_kart/utils/shimmer/list_tile_shimmer.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
      future: controller.getBrandsForCategory(category.id),
      builder: (context, snapshot) {
        ///Handle Loader, No Record and Error Message
        const loader = Column(
          children: [
            SKListTileShimmerEffect(),
            SizedBox(height: SKSizes.spaceBtwItems),
            SKBoxShimmerEffect(),
            SizedBox(height: SKSizes.spaceBtwItems),
          ],
        );

        final widget = SKCloudHelperFunctions.checkMultipleRecordState(
            snapshot: snapshot, loader: loader);

        if (widget != null) return widget;

        ///Brand Found
        final brands = snapshot.data!;
        if (kDebugMode) {
          print(brands);
        }

        return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: brands.length,
            itemBuilder: (_, index) {
              final brand = brands[index];
              return FutureBuilder(
                  future:
                      controller.getBrandProducts(brandId: brand.id, limit: 3),
                  builder: (context, snapshot) {
                    ///Handle Loader, No Record or Error Message
                    final widget = SKCloudHelperFunctions.checkMultipleRecordState(snapshot: snapshot, loader: loader);

                    if(widget != null) return widget;

                    ///Record Found
                    final products = snapshot.data!;
                    if (kDebugMode) {
                      print('Hello $products');
                    }

                    return SKBrandShowcase(
                      brand: brand,
                      images: products.map((e) => e.thumbnail).toList(),
                    );
                  });
            });
      },
    );
  }
}
