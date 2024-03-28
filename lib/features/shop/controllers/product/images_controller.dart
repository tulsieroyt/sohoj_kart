import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sohoj_kart/features/shop/models/products/product_model.dart';
import 'package:sohoj_kart/utils/constants/sizes.dart';

class ImagesController extends GetxController {
  static ImagesController get instance => Get.find();

  ///Variable
  RxString selectedProductImage = ''.obs;

  ///Get all images from products and variations

  List<String> getAllProductImages(ProductModel product) {
    //Use Set to add unique images only
    Set<String> images = {};
    print(images);

    //Load thumbnail images
    if (product.thumbnail.isNotEmpty) {
      images.add(product.thumbnail);
      selectedProductImage.value = product.thumbnail;
    }

    //Assign thumbnail as Selected Image
    selectedProductImage.value = product.thumbnail;



    //Get all images from the Product Model if not null
    //Get all images from the Product Model if not null
    if (product.images != null) {
      for (var image in product.images!) {
        if (image.isNotEmpty) {
          images.add(image);
        }
      }
    }

    //Get all images from the Product Variations if not null
    if (product.productVariations != null && product.productVariations!.isNotEmpty) {
      for (var variation in product.productVariations!) {
        if (variation.image.isNotEmpty) {
          images.add(variation.image);
        }
      }
    }
    //Return this list
    return images.toList();
  }

  ///Show Image Popup
  void showEnlargedImage(String image) {
    Get.to(
      fullscreenDialog: true,
      () => Dialog.fullscreen(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: SKSizes.defaultSpace * 2,
                  horizontal: SKSizes.defaultSpace),
              child: CachedNetworkImage(imageUrl: image),
            ),
            const SizedBox(height: SKSizes.spaceBtwSections),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 150,
                child: OutlinedButton(
                  onPressed: () => Get.back(),
                  child: const Text('Close'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
