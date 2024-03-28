import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sohoj_kart/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:sohoj_kart/utils/constants/colors.dart';
import 'package:sohoj_kart/utils/constants/sizes.dart';
import 'package:sohoj_kart/utils/device/device_utility.dart';
import 'package:sohoj_kart/utils/helpers/helper_functions.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = SKHelperFunctions.isDarkMode(context);
    return Positioned(
      bottom: SKDeviceUtils.getBottomNavigationBarHeight() + 25,
      left: SKSizes.defaultSpace,
      child: SmoothPageIndicator(
        effect: ExpandingDotsEffect(
          activeDotColor: dark ? SKColors.light : SKColors.dark,
          dotHeight: 6,
        ),
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        count: 3,
      ),
    );
  }
}
