import 'package:get/get.dart';
import 'package:sohoj_kart/data/repositories/categories/category_repository.dart';
import 'package:sohoj_kart/data/repositories/product/product_repository.dart';
import 'package:sohoj_kart/features/shop/models/category_model.dart';
import 'package:sohoj_kart/features/shop/models/products/product_model.dart';
import 'package:sohoj_kart/utils/popups/loaders.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  ///Load category Data
  Future<void> fetchCategories() async {
    try {
      //Show loader while loading categories
      isLoading.value = true;

      //Fetch categories fom data sources(Firestore, API, etc)
      final categories = await _categoryRepository.getAllCategories();

      //Update the category list
      allCategories.assignAll(categories);

      //Filter featured categories
      featuredCategories.assignAll(allCategories
          .where((category) => category.isFeatured && category.parentId.isEmpty)
          .take(8)
          .toList());
    } catch (e) {
      SKLoaders.errorSnackBar(title: 'On Snap!', message: e.toString());
    } finally {
      //Remove Loader
      isLoading.value = false;
    }
  }

  ///Load Selected Category Data

  ///Get Category and sub-category
  Future<List<ProductModel>> getCategoryProducts(
      {required String categoryId, int limit = 4}) async {
    try {
      //Fetch Limited (4) products against each category
      final products = await ProductRepository.instance
          .getProductForCategory(categoryId: categoryId, limit: limit);

      return products;
    } catch (e) {
      SKLoaders.errorSnackBar(title: 'On Snap!', message: e.toString());
      return [];
    }
  }

  ///Get sub-category
  Future<List<CategoryModel>> getSubCategories(
      {required String categoryId}) async {
    try {
      final subCategories =
          await _categoryRepository.getSubCategories(categoryId);
      return subCategories;
    } catch (e) {
      SKLoaders.errorSnackBar(title: 'On Snap!', message: e.toString());
      return [];
    }
  }
}
