import 'package:get/get.dart';
import 'package:sohoj_kart/features/personalization/controllers/address/address_controller.dart';
import 'package:sohoj_kart/features/shop/controllers/checkout_controller.dart';
import 'package:sohoj_kart/features/shop/controllers/product/variation_controller.dart';
import 'package:sohoj_kart/utils/network/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(VariationController());
    Get.put(AddressController());
    Get.put(CheckoutController());
  }
}
