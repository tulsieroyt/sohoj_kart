import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sohoj_kart/common/widgets/products/product_icon/favourite_icon.dart';
import 'package:sohoj_kart/features/shop/controllers/product/images_controller.dart';
import 'package:sohoj_kart/features/shop/models/products/product_model.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/custom_edges/curved_edges_widget.dart';
import '../../../../../common/widgets/images/rounded_images.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class SKProductDetailsImageSlider extends StatelessWidget {
  const SKProductDetailsImageSlider({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final darkMode = SKHelperFunctions.isDarkMode(context);

    final controller = Get.put(ImagesController());
    final images = controller.getAllProductImages(product);
    return SKCurvedEdgeWidget(
      child: Container(
        color: darkMode ? SKColors.darkerGrey : SKColors.light,
        child: Stack(
          children: [
            ///Main Large Image
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(SKSizes.productItemRadius * 2),
                child: Center(
                  child: Obx(() {
                    final image = controller.selectedProductImage.value;
                    return GestureDetector(
                      onTap: () => controller.showEnlargedImage(image),
                      child: CachedNetworkImage(
                        imageUrl: image,
                        progressIndicatorBuilder: (_, __, downloadProgress) =>
                            CircularProgressIndicator(
                          value: downloadProgress.progress,
                          color: SKColors.primary,
                        ),
                        errorWidget: (context, url, error) =>
                            Text(error.toString()),
                      ),
                    );
                  }),
                ),
              ),
            ),

            ///Image Slider
            Positioned(
              right: 0,
              bottom: 30,
              left: SKSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: images.length,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (_, index) {
                    return Obx(() {
                      final imageSelected =
                          controller.selectedProductImage.value ==
                              images[index];
                      return SKRoundedImage(
                        height: 80,
                        width: 80,
                        backgroundColor:
                            darkMode ? SKColors.dark : SKColors.white,
                        isNetworkImage: true,
                        border: Border.all(
                          color: imageSelected
                              ? SKColors.primary
                              : Colors.transparent,
                        ),
                        padding: const EdgeInsets.all(SKSizes.sm),
                        onPressed: () => controller.selectedProductImage.value =
                            images[index],
                        imageUrl: images[index],
                        fit: BoxFit.cover,
                      );
                    });
                  },
                  separatorBuilder: (_, __) {
                    return const SizedBox(width: SKSizes.spaceBtwItems);
                  },
                ),
              ),
            ),

            ///AppBar Icon
            SKAppBar(
              showBackArrow: true,
              actions: [SKFavouriteIcon(productId: product.id)],
            )
          ],
        ),
      ),
    );
  }
}
