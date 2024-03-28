import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sohoj_kart/features/shop/controllers/product/all_products_controller.dart';
import 'package:sohoj_kart/features/shop/models/products/product_model.dart';

import '../../../../utils/constants/sizes.dart';
import '../../layouts/grid_layout.dart';
import '../product_cards/product_cards_vertical.dart';

class SkSortableProducts extends StatelessWidget {
  const SkSortableProducts({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    controller.assignProducts(products);
    return Column(
      children: [
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          value: controller.selectedSortOption.value,
          items: [
            'Name',
            'Higher Price',
            'Lower Price',
            'Sale',
            'Newest',
            'Popularity'
          ]
              .map((item) => DropdownMenuItem(value: item, child: Text(item)))
              .toList(),
          onChanged: (value) {
            //Sort products based on the selected option
            controller.sortProducts(value!);
          },
        ),
        const SizedBox(height: SKSizes.spaceBtwSections),

        ///Products
        Obx(
          () => SKGridLayout(
            itemCount: controller.products.length,
            itemBuilder: (_, index) => SKProductCardVertical(
              product: controller.products[index],
            ),
          ),
        )
      ],
    );
  }
}
