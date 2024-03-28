import 'package:get/get.dart';
import 'package:sohoj_kart/data/repositories/product/product_repository.dart';
import 'package:sohoj_kart/features/shop/models/products/product_model.dart';
import 'package:sohoj_kart/utils/constants/enums.dart';
import 'package:sohoj_kart/utils/popups/loaders.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  ///Variable
  final isLoading = false.obs;
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;
  final productRepository = Get.put(ProductRepository());

  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  ///fetch all data
  void fetchFeaturedProducts() async {
    try {
      //Start Loading
      isLoading.value = true;

      //Fetch the product
      final products = await productRepository.fetchProductData();

      //Assign product
      featuredProducts.assignAll(products);
    } catch (e) {
      SKLoaders.errorSnackBar(title: 'On Snap', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  ///fetch all data
  Future<List<ProductModel>> fetchAllFeaturedProducts() async {
    try {
      //Fetch the product
      final products = await productRepository.getAllFeaturedProducts();
      return products;
    } catch (e) {
      SKLoaders.errorSnackBar(title: 'On Snap', message: e.toString());
      return [];
    }
  }

  ///Get the product price or price for range variations
  String getProductPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    //Get the price and the sale price
    if (product.productType == ProductType.single.toString()) {
      return (product.salePrice > 0 ? product.salePrice : product.price)
          .toString();
    } else {
      //Calculate the smallest and largest prices among variations
      for (var variation in product.productVariations!) {
        //Determine the price to consider(sale price if available, otherwise regular price)
        double priceToConsider =
            variation.salePrice > 0.0 ? variation.salePrice : variation.price;

        //Update smallest and largest price
        if (priceToConsider < smallestPrice) {
          smallestPrice = priceToConsider;
        }

        if (priceToConsider > largestPrice) {
          largestPrice = priceToConsider;
        }
      }
      // If smallest and largest price are the same, return a single price
      if (smallestPrice.isEqual(largestPrice)) {
        return largestPrice.toString();
      } else {
        return '$smallestPrice - \$$largestPrice';
      }
    }
  }

  ///Calculate sale percentages
  String? calculateSalePercentages(double originalPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0.0) return null;
    if (originalPrice <= 0) return null;
    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

  ///Check Product Stock Status
  String getProductStockStatus(int stock) {
    return stock > 0 ? 'In Stock' : 'Out of Stock';
  }
}
