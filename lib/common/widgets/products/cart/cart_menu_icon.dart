import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sohoj_kart/features/shop/controllers/cart_controller.dart';
import 'package:sohoj_kart/features/shop/screens/cart/cart_screen.dart';
import 'package:sohoj_kart/utils/constants/colors.dart';
import 'package:sohoj_kart/utils/helpers/helper_functions.dart';

class SKCartCounterIcon extends StatelessWidget {
  const SKCartCounterIcon({
    super.key,
    this.iconColor,
    this.counterBgColor,
    this.counterTextColor,
  });

  final Color? iconColor, counterBgColor, counterTextColor;

  @override
  Widget build(BuildContext context) {
    //Get an instance of the CartController
    final controller = Get.put(CartController());
    final darkMode = SKHelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        IconButton(
          onPressed: () => Get.to(() => const CartScreen()),
          icon: Icon(
            Iconsax.shopping_bag,
            color: iconColor,
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            height: 18,
            width: 18,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: counterBgColor ??
                    (darkMode ? SKColors.white : SKColors.black)),
            child: Center(
              child: Obx(
                () => Text(
                  controller.noOfCartItems.value.toString(),
                  style: Theme.of(context).textTheme.labelLarge!.apply(
                      color: counterBgColor ??
                          (darkMode ? SKColors.black : SKColors.white)),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
