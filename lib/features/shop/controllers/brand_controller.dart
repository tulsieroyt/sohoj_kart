import 'package:get/get.dart';
import 'package:sohoj_kart/data/repositories/brands/brand_repository.dart';
import 'package:sohoj_kart/data/repositories/product/product_repository.dart';
import 'package:sohoj_kart/features/shop/models/products/brand_model.dart';
import 'package:sohoj_kart/features/shop/models/products/product_model.dart';
import 'package:sohoj_kart/utils/popups/loaders.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find();

  RxBool isLoading = false.obs;
  final RxList<BrandModel> featuredBrands = <BrandModel>[].obs;
  final RxList<BrandModel> allBrands = <BrandModel>[].obs;
  final brandRepository = Get.put(BrandRepository());

  @override
  void onInit() {
    getFeaturedBrands();
    super.onInit();
  }

  ///Load Brands
  Future<void> getFeaturedBrands() async {
    try {
      //Start Loading
      isLoading.value = true;

      final brands = await brandRepository.getAllBrands();

      allBrands.assignAll(brands);

      featuredBrands.assignAll(
          allBrands.where((brand) => brand.isFeatured ?? false).take(4));
    } catch (e) {
      SKLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  ///Get Brand for Category
  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
    try {
      final brands = await brandRepository.getBrandForCategory(categoryId);
      print(brands);
      return brands;
    } catch (e) {
      SKLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  ///Get Brand specific Products form your data source
  Future<List<ProductModel>> getBrandProducts(
      {required String brandId, int limit = -1}) async {
    try {
      final products = await ProductRepository.instance
          .getProductForBrand(brandId: brandId, limit: limit);
      return products;
    } catch (e) {
      SKLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }
}
