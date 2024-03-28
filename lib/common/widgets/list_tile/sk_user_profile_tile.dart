import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sohoj_kart/common/widgets/images/circular_images.dart';
import 'package:sohoj_kart/features/personalization/controllers/user/user_controller.dart';
import 'package:sohoj_kart/features/personalization/screens/profile/profile_screen.dart';
import 'package:sohoj_kart/utils/constants/colors.dart';
import 'package:sohoj_kart/utils/constants/image_strings.dart';

import '../../../utils/shimmer/shimmer_effect.dart';

class SKUserProfileTile extends StatelessWidget {
  const SKUserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return ListTile(
      leading: Obx(
        () {
          final networkImage = controller.user.value.profilePicture;

          final image =
              networkImage.isNotEmpty ? networkImage : SKImages.userImage;
          return controller.imageLoading.value
              ? const SKShimmerEffect(height: 50, width: 50)
              : SKCircularImage(
                  image: image,
                  height: 50,
                  width: 50,
                  padding: 0,
                  fit: BoxFit.cover,
                  isNetworkImage: networkImage.isNotEmpty,
                );
        },
      ),
      title: Text(
        controller.user.value.fullName,
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: SKColors.white),
      ),
      subtitle: Text(
        controller.user.value.email,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .apply(color: SKColors.white),
      ),
      trailing: IconButton(
        onPressed: () => Get.to(const ProfileScreen()),
        icon: const Icon(
          Iconsax.edit,
          color: SKColors.white,
        ),
      ),
    );
  }
}
