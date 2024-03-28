import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sohoj_kart/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:sohoj_kart/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:sohoj_kart/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:sohoj_kart/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:sohoj_kart/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:sohoj_kart/utils/constants/image_strings.dart';
import 'package:sohoj_kart/utils/constants/text_strings.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  void initState() {
    FocusScope.of(Get.context!).unfocus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: SKImages.onBoardingImage1,
                title: SKTexts.onBoardingTitle1,
                subTitle: SKTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: SKImages.onBoardingImage2,
                title: SKTexts.onBoardingTitle2,
                subTitle: SKTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: SKImages.onBoardingImage3,
                title: SKTexts.onBoardingTitle3,
                subTitle: SKTexts.onBoardingSubTitle3,
              ),
            ],
          ),
          const OnBoardingSkip(),
          const OnBoardingDotNavigation(),
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}
