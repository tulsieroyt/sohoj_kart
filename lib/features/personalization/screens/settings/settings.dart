import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sohoj_kart/common/widgets/appbar/appbar.dart';
import 'package:sohoj_kart/common/widgets/custom_shapes/container/primary_header_container.dart';
import 'package:sohoj_kart/common/widgets/list_tile/sk_settings_menu_tile.dart';
import 'package:sohoj_kart/common/widgets/list_tile/sk_user_profile_tile.dart';
import 'package:sohoj_kart/common/widgets/texts/section_heading.dart';
import 'package:sohoj_kart/data/repositories/authentication/authentication_repository.dart';
import 'package:sohoj_kart/dummy/dummy_data_upload_screen.dart';
import 'package:sohoj_kart/dummy_upload_screen.dart';
import 'package:sohoj_kart/features/personalization/screens/address/address_screen.dart';
import 'package:sohoj_kart/features/shop/screens/cart/cart_screen.dart';
import 'package:sohoj_kart/features/shop/screens/order/order_screen.dart';
import 'package:sohoj_kart/utils/constants/sizes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///Header
            SKPrimaryHeaderContainer(
              child: Column(
                children: [
                  SKAppBar(
                    title: Text(
                      'Account',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: Colors.white),
                    ),
                  ),

                  ///User Profile card
                  const SKUserProfileTile(),
                  const SizedBox(height: SKSizes.spaceBtwSections),
                ],
              ),
            ),

            /// Body or Settings
            Padding(
              padding: const EdgeInsets.all(SKSizes.defaultSpace),
              child: Column(
                children: [
                  const SKSectionHeading(
                    sectionText: 'Profile Settings',
                    showButton: false,
                  ),
                  const SizedBox(height: SKSizes.spaceBtwItems),
                  SKSettingsMenuTile(
                    icon: Iconsax.safe_home,
                    title: 'My Address',
                    subtitle: 'Set shopping delivery address',
                    onTap: () => Get.to(() => const UserAddressScreen()),
                  ),
                  SKSettingsMenuTile(
                    icon: Iconsax.shopping_cart,
                    title: 'My Cart',
                    subtitle: 'Add, remove products and move to checkout',
                    onTap: () => Get.to(() => const CartScreen( )),
                  ),
                  SKSettingsMenuTile(
                    icon: Iconsax.bag_tick,
                    title: 'My Orders',
                    subtitle: 'In Progress and Completed orders',
                    onTap: () => Get.to(() => const OrderScreen()),
                  ),
                  SKSettingsMenuTile(
                    icon: Iconsax.bank,
                    title: 'Bank Account',
                    subtitle: 'Withdraw balance to registered back account',
                    onTap: () {},
                  ),
                  SKSettingsMenuTile(
                    icon: Iconsax.discount_shape,
                    title: 'My Coupons',
                    subtitle: 'List of all discounted coupons',
                    onTap: () {},
                  ),
                  SKSettingsMenuTile(
                    icon: Iconsax.notification,
                    title: 'Notifications',
                    subtitle: 'Set any kind of notification messages',
                    onTap: () {},
                  ),
                  SKSettingsMenuTile(
                    icon: Iconsax.security_card,
                    title: 'Account Privacy',
                    subtitle: 'Manage data usage and connect ',
                    onTap: () {},
                  ),
                  const SizedBox(height: SKSizes.spaceBtwItems),
                  const SKSectionHeading(
                    sectionText: 'App Settings',
                    showButton: false,
                  ),
                  const SizedBox(height: SKSizes.spaceBtwItems),
                  SKSettingsMenuTile(
                    icon: Iconsax.document_upload,
                    title: 'Load Data',
                    subtitle: 'Upload data to your cloud Firebase',
                    onTap: () {
                      Get.to(const DummyUploadScreen());
                    },
                  ),
                  SKSettingsMenuTile(
                    icon: Iconsax.location,
                    title: 'Geolocation',
                    subtitle: 'Set recommendation based on location',
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  SKSettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: 'Safe Mode',
                    subtitle: 'Search result is safe for all ages',
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  SKSettingsMenuTile(
                    icon: Iconsax.image,
                    title: 'HD Image Quality',
                    subtitle: 'Set image quality to be seen',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  const SizedBox(height: SKSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () =>
                          AuthenticationRepository.instance.logout(),
                      child: const Text('Logout'),
                    ),
                  ),
                  const SizedBox(height: SKSizes.spaceBtwSections * 2),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
