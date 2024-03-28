import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sohoj_kart/data/repositories/authentication/authentication_repository.dart';
import 'package:sohoj_kart/data/repositories/user/user_repository.dart';
import 'package:sohoj_kart/features/authentication/models/user/user_model.dart';
import 'package:sohoj_kart/features/authentication/screens/signup/verify_email.dart';
import 'package:sohoj_kart/utils/constants/image_strings.dart';
import 'package:sohoj_kart/utils/network/network_manager.dart';
import 'package:sohoj_kart/utils/popups/full_screen_loader.dart';
import 'package:sohoj_kart/utils/popups/loaders.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  ///Variables
  final hidePassword = true.obs; // Observable for hiding / showing password
  final privacyPolicy = true.obs; // Observable for privacy policy acceptance
  final email = TextEditingController(); //Controller for email input
  final firstName = TextEditingController(); //Controller for email input
  final lastName = TextEditingController(); //Controller for email input
  final userName = TextEditingController(); //Controller for email input
  final password = TextEditingController(); //Controller for email input
  final phoneNumber = TextEditingController(); //Controller for email input
  GlobalKey<FormState> signUpFormKey =
      GlobalKey<FormState>(); //Form key for validation

  ///Sign up
  Future<void> signup() async {
    try {
      //Start Loading
      SKFullScreenLoader.openLoadingDialog(
        'We are processing your information....',
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
      if (!signUpFormKey.currentState!.validate()) {
        //Remove Loader
        SKFullScreenLoader.stopLoading();
        return;
      }

      //Privacy Policy check
      if (!privacyPolicy.value) {
        SKLoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message: 'In order to create account, you must '
              'have to read and accept the Privacy Policy and Terms of Use',
        );
        return;
      }

      //Register user in the Firebase authentication and save user data in the firebase
      final userCredential =
          await AuthenticationRepository.instance.registerWithEmailAndPassword(
        email.text.trim(),
        password.text.trim(),
      );

      //Save Authentication data to the firebase storage
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        userName: userName.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );
      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      //Remove Loader
      SKFullScreenLoader.stopLoading();

      //Save success message
      SKLoaders.successSnackBar(
        title: 'Congratulations',
        message: 'Your account has been created. Verify email to continue.',
      );

      //Move to the verify email screen
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      //Remove Loader
      SKFullScreenLoader.stopLoading();

      //SHow some Generic Error to the user`
      SKLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
