import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sohoj_kart/common/widgets/custom_shapes/container/circular_container.dart';
import 'package:sohoj_kart/common/widgets/images/rounded_images.dart';
import 'package:sohoj_kart/features/shop/controllers/banner_controller.dart';
import 'package:sohoj_kart/utils/constants/colors.dart';
import 'package:sohoj_kart/utils/constants/sizes.dart';
import 'package:sohoj_kart/utils/shimmer/shimmer_effect.dart';

class SKPromoSlider extends StatelessWidget {
  const SKPromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(() {
      if (controller.isLoading.value) {
        return const SKShimmerEffect(height: 190, width: double.infinity);
      }
      if (controller.banners.isEmpty) {
        return const Center(child: Text('No Data Found'));
      } else {
        return Column(
          children: [
            CarouselSlider(
                options: CarouselOptions(
                  viewportFraction: 1,
                  onPageChanged: (index, _) =>
                      controller.updatePageIndicator(index),
                ),
                items: controller.banners
                    .map((banner) => SKRoundedImage(
                          imageUrl: banner.imageUrl,
                          isNetworkImage: true,
                          onPressed: () => Get.toNamed(banner.targetScreen),
                        ))
                    .toList()),
            const SizedBox(height: SKSizes.spaceBtwItems),
            Center(
              child: Obx(
                () => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (int i = 0; i < controller.banners.length; i++)
                      SKCircularContainer(
                        height: 4,
                        width: 20,
                        margin: const EdgeInsets.only(right: 10),
                        backgroundColor:
                            controller.carouselCurrentIndex.value == i
                                ? SKColors.primary
                                : SKColors.grey,
                      )
                  ],
                ),
              ),
            )
          ],
        );
      }
    });
  }
}
