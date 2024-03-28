import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sohoj_kart/data/repositories/authentication/authentication_repository.dart';
import 'package:sohoj_kart/features/personalization/controllers/user/user_controller.dart';
import 'package:sohoj_kart/utils/constants/image_strings.dart';
import 'package:sohoj_kart/utils/popups/full_screen_loader.dart';
import 'package:sohoj_kart/utils/popups/loaders.dart';

import '../../../../utils/network/network_manager.dart';

class LoginController extends GetxController {
  ///Variable
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  final
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  @override
  void onInit() {
    super.onInit();
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
  }

  /// -- Email and Password Sign in
  Future<void> emailAndPasswordSignIn() async {
    try {
      //Start Loading
      SKFullScreenLoader.openLoadingDialog(
        'Logging you in....',
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
      if (!loginFormKey.currentState!.validate()) {
        //Remove Loader
        SKFullScreenLoader.stopLoading();
        return;
      }

      //Save Data if Remember Me is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      //User credentials
      await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      //Remove Loader
      SKFullScreenLoader.stopLoading();

      //Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      //Stop Loading
      SKFullScreenLoader.stopLoading();

      //Showing Error Message
      SKLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  ///--Google sign in
  Future<void> googleSignIn() async {
    try {
      //Start Loader
      SKFullScreenLoader.openLoadingDialog(
          'Logging you in...', SKImages.processLottieAnimation);

      //Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        //Remove Loader
        SKFullScreenLoader.stopLoading();
        return;
      }

      //Google Authentication
      final userCredentials =
          await AuthenticationRepository.instance.signInWithGoogle();

      //Save User Record
      await userController.saveUserRecord(userCredentials);

      //Stop Loader
      SKFullScreenLoader.stopLoading();

      //Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      //Stop Loader
      SKFullScreenLoader.stopLoading();
      SKLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
