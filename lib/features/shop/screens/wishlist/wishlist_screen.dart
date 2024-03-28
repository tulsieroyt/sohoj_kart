import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sohoj_kart/common/widgets/appbar/appbar.dart';
import 'package:sohoj_kart/common/widgets/layouts/grid_layout.dart';
import 'package:sohoj_kart/common/widgets/loaders/animation_loader.dart';
import 'package:sohoj_kart/common/widgets/products/product_cards/product_cards_vertical.dart';
import 'package:sohoj_kart/features/shop/controllers/product/favourite_controller.dart';
import 'package:sohoj_kart/navigation_menu.dart';
import 'package:sohoj_kart/utils/constants/image_strings.dart';
import 'package:sohoj_kart/utils/constants/sizes.dart';
import 'package:sohoj_kart/utils/helpers/cloud_helper_function.dart';
import 'package:sohoj_kart/utils/shimmer/vertical_product_shimmer.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = FavouriteController.instance;
    return Scaffold(
      ///Custom AppBar
      appBar: SKAppBar(
        title: Text(
          'WishList',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: const [
          //SKFavouriteIcon(productId: product.id),
        ],
      ),

      ///Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SKSizes.defaultSpace),

          ///Products Card
          child: Obx(
            () => FutureBuilder(
                future: controller.favouritesProducts(),
                builder: (context, snapshot) {
                  ///Nothing Found Widget
                  final emptyWidget = SKAnimationLoaderWidget(
                    text: 'Whoops! Wishlist is Empty...',
                    animation: SKImages.emptyWishlistAnimation,
                    showAction: true,
                    actionText: 'Let\'s add some',
                    onActionPressed: () {
                      NavigationMenuController.instance.selectedIndex.value = 0;
                      Get.off(() => const NavigationMenu());
                    }
                  );

                  const loader = SKVerticalProductShimmer(itemCount: 6);
                  final widget =
                      SKCloudHelperFunctions.checkMultipleRecordState(
                    snapshot: snapshot,
                    loader: loader,
                    nothingFound: emptyWidget,
                  );

                  if (widget != null) return widget;

                  final products = snapshot.data!;

                  return SKGridLayout(
                    itemCount: products.length,
                    itemBuilder: (_, index) => SKProductCardVertical(
                      product: products[index],
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
