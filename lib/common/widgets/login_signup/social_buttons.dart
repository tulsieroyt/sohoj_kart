import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sohoj_kart/features/authentication/controllers/login/login_controller.dart';
import 'package:sohoj_kart/utils/constants/colors.dart';
import 'package:sohoj_kart/utils/constants/image_strings.dart';
import 'package:sohoj_kart/utils/constants/sizes.dart';

class SKSocialButtons extends StatelessWidget {
  const SKSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: SKColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () => controller.googleSignIn(),
            icon: const Image(
              width: SKSizes.iconMd,
              height: SKSizes.iconMd,
              image: AssetImage(SKImages.google),
            ),
          ),
        ),
        const SizedBox(
          width: SKSizes.spaceBtwItems,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: SKColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              width: SKSizes.iconMd,
              height: SKSizes.iconMd,
              image: AssetImage(SKImages.facebook),
            ),
          ),
        ),
      ],
    );
  }
}