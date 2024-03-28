import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sohoj_kart/common/widgets/appbar/appbar.dart';
import 'package:sohoj_kart/features/shop/controllers/product/all_products_controller.dart';
import 'package:sohoj_kart/utils/constants/sizes.dart';
import 'package:sohoj_kart/utils/helpers/cloud_helper_function.dart';
import 'package:sohoj_kart/utils/shimmer/vertical_product_shimmer.dart';

import '../../../../common/widgets/products/sortable/sortable_products.dart';
import '../../models/products/product_model.dart';

class AllProductScreen extends StatelessWidget {
  const AllProductScreen({
    super.key,
    required this.title,
    this.query,
    this.featuredMethod,
  });

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? featuredMethod;

  @override
  Widget build(BuildContext context) {
    //Initialize controller for managing product fetching
    final controller = Get.put(AllProductsController());

    return Scaffold(
      appBar: SKAppBar(
        showBackArrow: true,
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SKSizes.defaultSpace),
          child: FutureBuilder(
              future: featuredMethod ?? controller.fetchProductByQuery(query),
              builder: (context, snapshot) {
                //Check the state of the FutureBuilder snapshot
                const loader = SKVerticalProductShimmer();

                final widget = SKCloudHelperFunctions.checkMultipleRecordState(
                  snapshot: snapshot,
                  loader: loader,
                );

                if(widget != null) return widget;

                //Products found
                final products = snapshot.data!;
                return SkSortableProducts(products: products);
              }),
        ),
      ),
    );
  }
}
