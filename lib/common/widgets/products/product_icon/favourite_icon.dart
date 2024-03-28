import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sohoj_kart/common/widgets/icon/sk_circular_icon.dart';
import 'package:sohoj_kart/features/shop/controllers/product/favourite_controller.dart';
import 'package:sohoj_kart/utils/constants/colors.dart';

class SKFavouriteIcon extends StatelessWidget {
  const SKFavouriteIcon({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouriteController());
    return Obx(
      () => SKCircularIcon(
        icon:
            controller.isFavourite(productId) ? Iconsax.heart5 : Iconsax.heart,
        color: controller.isFavourite(productId) ? SKColors.error : null,
        onPressed: () => controller.toggleFavouriteProduct(productId),
      ),
    );
  }
}
