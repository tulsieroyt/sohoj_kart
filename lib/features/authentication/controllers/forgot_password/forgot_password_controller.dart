import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sohoj_kart/data/repositories/authentication/authentication_repository.dart';
import 'package:sohoj_kart/features/authentication/screens/password_configuration/reset_password_screen.dart';
import 'package:sohoj_kart/utils/popups/loaders.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/network/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';

class ForgotPasswordController extends GetxController {
  static ForgotPasswordController get instance => Get.find();

  ///Variable
  final email = TextEditingController();
  GlobalKey<FormState> forgotPasswordFormKey = GlobalKey<FormState>();

  ///Send Rest Password Email
  sendPasswordResetEmail() async {
    try {
      //Start Loading
      SKFullScreenLoader.openLoadingDialog(
        'Processing your request....',
        SKImages.processLottieAnimation,
      );

      //Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        //Remove Loader
        SKFullScreenLoader.stopLoading();
        return;
      }

      //Form Validation
      if (!forgotPasswordFormKey.currentState!.validate()) {
        //Remove Loader
        SKFullScreenLoader.stopLoading();
        return;
      }

      //Send password reset email
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      //Stop Loader
      SKFullScreenLoader.stopLoading();

      //Success SnackBar
      SKLoaders.successSnackBar(
        title: 'Email sent',
        message: 'Email Link Sent to Reset your Password'.tr,
      );

      //Redirect
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      //Stop Loader
      SKFullScreenLoader.stopLoading();
      SKLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async{
    try {
      //Start Loading
      SKFullScreenLoader.openLoadingDialog(
        'Processing your request....',
        SKImages.processLottieAnimation,
      );

      //Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        //Remove Loader
        SKFullScreenLoader.stopLoading();
        return;
      }


      //Send password reset email
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);


      //Stop Loader
      SKFullScreenLoader.stopLoading();

      //Success SnackBar
      SKLoaders.successSnackBar(
        title: 'Email sent',
        message: 'Email Link Sent to Reset your Password'.tr,
      );

    } catch (e) {
      //Stop Loader
      SKFullScreenLoader.stopLoading();
      SKLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
