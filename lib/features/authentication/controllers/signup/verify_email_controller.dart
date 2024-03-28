import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:sohoj_kart/common/widgets/success_screen/success_screen.dart';
import 'package:sohoj_kart/data/repositories/authentication/authentication_repository.dart';
import 'package:sohoj_kart/utils/constants/image_strings.dart';
import 'package:sohoj_kart/utils/constants/text_strings.dart';
import 'package:sohoj_kart/utils/popups/loaders.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  ///Send Email Whenever Verify Screen appears and Set timer to auto redirect
  @override
  void onInit() {
    sendEmailVerification();
    setTimerToAutoRedirect();
    super.onInit();
  }

  ///Send Email Verification Link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      SKLoaders.successSnackBar(
        title: 'Email Sent',
        message: 'Please check you email and verify your email',
      );
    } catch (e) {
      SKLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  ///Timer to automatically redirect on Email Verification
  setTimerToAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(
          () => SuccessScreen(
            image: SKImages.successImage,
            title: SKTexts.yourAccountCreatedTitle,
            subtitle: SKTexts.yourAccountCreatedSubTitle,
            onPressed: () => AuthenticationRepository.instance.screenRedirect(),
          ),
        );
      }
    });
  }

  ///Manually check id Email Verified
  checkEmailVerificationStatus() async{
    final currentUser = FirebaseAuth.instance.currentUser;
    if(currentUser != null && currentUser.emailVerified){
      Get.off(
            () => SuccessScreen(
          image: SKImages.successImage,
          title: SKTexts.yourAccountCreatedTitle,
          subtitle: SKTexts.yourAccountCreatedSubTitle,
          onPressed: () => AuthenticationRepository.instance.screenRedirect(),
        ),
      );
    }
  }
}
