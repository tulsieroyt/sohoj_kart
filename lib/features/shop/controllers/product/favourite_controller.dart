import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:sohoj_kart/data/repositories/product/product_repository.dart';
import 'package:sohoj_kart/features/shop/models/products/product_model.dart';
import 'package:sohoj_kart/utils/local_storage/storage_utility.dart';
import 'package:sohoj_kart/utils/popups/loaders.dart';

class FavouriteController extends GetxController {
  static FavouriteController get instance => Get.find();

  ///Variable
  final favourites = <String, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    initFavourite();
  }

  //Method to initialize favourite by reading form storage
  Future<void> initFavourite() async {
    final json = SKLocalStorage.instance().readData('favourites');
    if (json != null) {
      final storedFavourites = jsonDecode(json) as Map<String, dynamic>;
      favourites.assignAll(
          storedFavourites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  //Check the product is in wishlist or not
  bool isFavourite(String productId) {
    return favourites[productId] ?? false;
  }

  void toggleFavouriteProduct(String productId) {
        if (!favourites.containsKey(productId)) {
      favourites[productId] = true;
      saveFavouritesStorage();
      SKLoaders.customToasts(message: 'Product has been added to the WishList');
    } else {
      SKLocalStorage.instance().removeData(productId);
      favourites.remove(productId);
      saveFavouritesStorage();
      favourites.refresh();
      SKLoaders.customToasts(
          message: 'Product has been removed to the WishList');
    }
  }

  void saveFavouritesStorage() {
    final encodedFavourites = json.encode(favourites);
    SKLocalStorage.instance().saveData('favourites', encodedFavourites);
  }

  Future<List<ProductModel>> favouritesProducts() async {
    return await ProductRepository.instance
        .getFavouriteProducts(favourites.keys.toList());
  }
}
