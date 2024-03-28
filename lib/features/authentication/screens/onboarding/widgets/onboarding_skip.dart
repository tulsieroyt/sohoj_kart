import 'package:flutter/material.dart';
import 'package:sohoj_kart/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:sohoj_kart/utils/constants/sizes.dart';
import 'package:sohoj_kart/utils/device/device_utility.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: SKDeviceUtils.isAndroid()
          ? SKDeviceUtils.getStatusBarHeight()
          : SKDeviceUtils.getAppBarHeight(),
      right: SKSizes.defaultSpace,
      child: TextButton(
        onPressed: () => OnBoardingController.instance.skipPage(),
        child: const Text('Skip'),
      ),
    );
  }
}
