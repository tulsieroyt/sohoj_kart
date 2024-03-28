import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sohoj_kart/common/widgets/success_screen/success_screen.dart';
import 'package:sohoj_kart/data/repositories/authentication/authentication_repository.dart';
import 'package:sohoj_kart/data/repositories/order/order_repository.dart';
import 'package:sohoj_kart/features/personalization/controllers/address/address_controller.dart';
import 'package:sohoj_kart/features/shop/controllers/cart_controller.dart';
import 'package:sohoj_kart/features/shop/controllers/checkout_controller.dart';
import 'package:sohoj_kart/navigation_menu.dart';
import 'package:sohoj_kart/utils/constants/enums.dart';
import 'package:sohoj_kart/utils/constants/image_strings.dart';
import 'package:sohoj_kart/utils/popups/full_screen_loader.dart';
import 'package:sohoj_kart/utils/popups/loaders.dart';

import '../models/order_model.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  ///Variable
  final cartController = CartController.instance;
  final addressController = AddressController.instance;
  final checkoutController = CheckoutController.instance;
  final orderRepository = Get.put(OrderRepository());

  ///Fetch user's order history
  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userOrders = await orderRepository.fetchUserOrders();
      return userOrders;
    } catch (e) {
      SKLoaders.warningSnackBar(title: 'Oh Snap', message: e.toString());
      return [];
    }
  }

  ///Add methods for order processing
  void processOrder(double totalAmount) async {
    try {
      //Start Loader
      SKFullScreenLoader.openLoadingDialog(
          'Processing your Order...', SKImages.processLottieAnimation);

      //get user authentication id
      final userId = AuthenticationRepository.instance.authUser!.uid;
      if (userId.isEmpty) return;

      /// Add Details
      final order = OrderModel(
        id: UniqueKey().toString(),
        userId: userId,
        status: OrderStatus.processing,
        totalAmount: totalAmount,
        orderDate: DateTime.now(),
        paymentMethod: checkoutController.selectedPaymentMethod.value.name,
        address: addressController.selectedAddress.value,
        //Set date as needed
        deliveryDate: DateTime.now(),
        items: cartController.cartItems.toList(),
      );

      //Save the order to firestore
      await orderRepository.saveData(order, userId);

      //Update the cart status
      cartController.clearCart();

      //Show the success screen
      Get.off(() => SuccessScreen(
            image: SKImages.successLottieAnimation,
            title: 'Payment Success!',
            subtitle: 'Your parcel will be shipped soon',
            onPressed: () => Get.offAll(() => const NavigationMenu()),
          ));
    } catch (e) {
      SKLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }




}
