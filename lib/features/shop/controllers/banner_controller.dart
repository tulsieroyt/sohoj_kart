import 'package:get/get.dart';
import 'package:sohoj_kart/data/repositories/banner/banner_repository.dart';
import 'package:sohoj_kart/features/shop/models/banner_model.dart';

import '../../../utils/popups/loaders.dart';

class BannerController extends GetxController {
  static BannerController get instance => Get.find();

  ///Variable
  final carouselCurrentIndex = 0.obs;
  final isLoading = false.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;

  ///Update Page Navigation Data
  void updatePageIndicator(index) {
    carouselCurrentIndex.value = index;
  }

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  ///Fetch Banners
  Future<void> fetchBanners() async {
    try {
      //Show loader while loading categories
      isLoading.value = true;

      //Fetch Banners
      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanners();

      //Assign Banners
      this.banners.assignAll(banners);
    } catch (e) {
      SKLoaders.errorSnackBar(title: 'On Snap!', message: e.toString());
    } finally {
      //Remove Loader
      isLoading.value = false;
    }
  }
}
