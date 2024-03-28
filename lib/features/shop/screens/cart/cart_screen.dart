import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sohoj_kart/common/widgets/appbar/appbar.dart';
import 'package:sohoj_kart/common/widgets/loaders/animation_loader.dart';
import 'package:sohoj_kart/features/shop/controllers/cart_controller.dart';
import 'package:sohoj_kart/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:sohoj_kart/features/shop/screens/checkout/checkout_screen.dart';
import 'package:sohoj_kart/navigation_menu.dart';
import 'package:sohoj_kart/utils/constants/image_strings.dart';
import 'package:sohoj_kart/utils/constants/sizes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Scaffold(
      appBar: SKAppBar(
        showBackArrow: true,
        title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Obx(() {
        ///Nothing found widget

        final emptyWidget = SKAnimationLoaderWidget(
          text: 'Whoops! Cart is EMPTY',
          animation: SKImages.emptyWishlistAnimation,
          showAction: true,
          actionText: 'Let\'s fill it',
          onActionPressed: () {
            NavigationMenuController.instance.selectedIndex.value = 0;
            Get.off(() => const NavigationMenu());
          },
        );

        return controller.cartItems.isEmpty
            ? emptyWidget
            //Can Add Single Child Scrollview to make it scrollable as a parent of padding widget
            : const SingleChildScrollView(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: SKSizes.defaultSpace),

                  ///-- Items in cart
                  child: SKCartItems(),
                ),
              );
      }),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(SKSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(() => const CheckoutScreen()),
          child:
              Obx(() => Text('Checkout \$${controller.totalCartPrice.value}')),
        ),
      ),
    );
  }
}
