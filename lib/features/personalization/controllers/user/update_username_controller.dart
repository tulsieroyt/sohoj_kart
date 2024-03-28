import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sohoj_kart/data/repositories/user/user_repository.dart';
import 'package:sohoj_kart/features/personalization/controllers/user/user_controller.dart';
import 'package:sohoj_kart/features/personalization/screens/profile/profile_screen.dart';
import 'package:sohoj_kart/utils/constants/image_strings.dart';
import 'package:sohoj_kart/utils/popups/full_screen_loader.dart';
import 'package:sohoj_kart/utils/popups/loaders.dart';

import '../../../../utils/network/network_manager.dart';

class UpdateUsernameController extends GetxController {
  static UpdateUsernameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  final GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  ///init user data when Home Screen appears
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  ///Fetch user record
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName; //Check null later
    lastName.text = userController.user.value.lastName; //Check null later
  }

  Future<void> updateUserName() async {
    try {
      //Start Loading
      SKFullScreenLoader.openLoadingDialog(
        'We are updating your information',
        SKImages.processLottieAnimation,
      );

      //Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        //Remove Loader
        SKFullScreenLoader.stopLoading();
        return;
      }

      //Validate the from
      if (!updateUserNameFormKey.currentState!.validate()) {
        SKFullScreenLoader.stopLoading();
        return;
      }

      //Update user's first & last name int he Firebase Firestore
      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim(),
      };
      await userRepository.updateSpecificField(name);

      //Update the Rx user value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      //remove Loader
      SKFullScreenLoader.stopLoading();

      //Show success message
      SKLoaders.successSnackBar(
        title: 'Congratulations',
        message: 'Your name has been updated.',
      );

      //Move to previous screen
      //TODO-Here is an error to solve
      //When I go redirect to the Profile Screen and press back button
      //It will redirect me to the Profile screen again -- have to solve it
      Get.off(() => const ProfileScreen());
    } catch (e) {
      //Stop Loader
      SKFullScreenLoader.stopLoading();
      SKLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
