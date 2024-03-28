import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sohoj_kart/common/widgets/appbar/appbar.dart';
import 'package:sohoj_kart/common/widgets/images/circular_images.dart';
import 'package:sohoj_kart/common/widgets/texts/section_heading.dart';
import 'package:sohoj_kart/dummy/dummy_data_upload.dart';
import 'package:sohoj_kart/features/personalization/controllers/user/user_controller.dart';
import 'package:sohoj_kart/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:sohoj_kart/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:sohoj_kart/utils/constants/image_strings.dart';
import 'package:sohoj_kart/utils/constants/sizes.dart';
import 'package:sohoj_kart/utils/shimmer/shimmer_effect.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const SKAppBar(
        title: Text('Profile'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SKSizes.defaultSpace),
          child: Column(
            children: [
              ///Profile Screen
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(
                      () {
                        final networkImage =
                            controller.user.value.profilePicture;

                        final image = networkImage.isNotEmpty
                            ? networkImage
                            : SKImages.userImage;
                        return controller.imageLoading.value
                            ? const SKShimmerEffect(height: 80, width: 80)
                            : SKCircularImage(
                                image: image,
                                height: 80,
                                width: 80,
                                fit: BoxFit.cover,
                                isNetworkImage: networkImage.isNotEmpty,
                              );
                      },
                    ),
                    TextButton(
                        onPressed: () => controller.uploadUserProfileImage(),
                        child: const Text('Change Profile Picture'))
                  ],
                ),
              ),
              const SizedBox(height: SKSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: SKSizes.spaceBtwItems),

              const SKSectionHeading(
                sectionText: 'Profile Information',
                showButton: false,
              ),
              SKProfileMenu(
                title: 'Name',
                value: controller.user.value.fullName,
                onPressed: () => Get.to(() => const ChangeName()),
              ),
              SKProfileMenu(
                title: 'Username',
                value: controller.user.value.userName,
                onPressed: () {},
              ),
              const Divider(),
              const SizedBox(height: SKSizes.spaceBtwItems),
              const SKSectionHeading(
                sectionText: 'Personal Information',
                showButton: false,
              ),
              SKProfileMenu(
                title: 'User ID',
                value: controller.user.value.id,
                icon: Iconsax.copy,
                onPressed: () {},
              ),
              SKProfileMenu(
                title: 'Email',
                value: controller.user.value.email,
                onPressed: () {},
              ),
              SKProfileMenu(
                title: 'Phone Number',
                value: controller.user.value.phoneNumber,
                onPressed: () {},
              ),
              SKProfileMenu(
                title: 'Gender',
                value: 'Male',
                onPressed: () {},
              ),
              SKProfileMenu(
                title: 'Date of Birth',
                value: '05 Feb 2002',
                onPressed: () {},
              ),
              const Divider(),
              const SizedBox(height: SKSizes.spaceBtwItems),
              //To Upload Dummy Data
              ElevatedButton(
                  onPressed: () => UploadDummyData().uploadBrandData(),
                  child: const Text('Upload Data Screen')),

              Center(
                child: TextButton(
                  onPressed: () => controller.deleteAccountWarningPopup(),
                  child: const Text(
                    'Delete Account',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
