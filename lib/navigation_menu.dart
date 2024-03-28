import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sohoj_kart/features/personalization/screens/settings/settings.dart';
import 'package:sohoj_kart/features/shop/screens/home/home_screen.dart';
import 'package:sohoj_kart/features/shop/screens/shop/store_screen.dart';
import 'package:sohoj_kart/features/shop/screens/wishlist/wishlist_screen.dart';
import 'package:sohoj_kart/utils/constants/text_strings.dart';
import 'package:sohoj_kart/utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationMenuController());
    final darkMode = SKHelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 60,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          backgroundColor: darkMode ? Colors.black : Colors.white,
          indicatorColor: darkMode
              ? Colors.white.withOpacity(0.1)
              : Colors.black.withOpacity(0.1),
          destinations: const [
            NavigationDestination(
                icon: Icon(Iconsax.home), label: SKTexts.home),
            NavigationDestination(
                icon: Icon(Iconsax.shop), label: SKTexts.shop),
            NavigationDestination(
                icon: Icon(Iconsax.heart), label: SKTexts.wishList),
            NavigationDestination(
                icon: Icon(Iconsax.user), label: SKTexts.profile),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationMenuController extends GetxController {
  static NavigationMenuController get instance => Get.find();

  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    const HomeScreen(),
    const StoreScreen(),
    const WishListScreen(),
    const SettingsScreen(),
  ];
}
