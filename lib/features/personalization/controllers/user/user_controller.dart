import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sohoj_kart/data/repositories/authentication/authentication_repository.dart';
import 'package:sohoj_kart/data/repositories/user/user_repository.dart';
import 'package:sohoj_kart/features/authentication/models/user/user_model.dart';
import 'package:sohoj_kart/features/authentication/screens/login/login.dart';
import 'package:sohoj_kart/features/personalization/screens/profile/widgets/re_authenticate_user_login_form.dart';
import 'package:sohoj_kart/utils/constants/image_strings.dart';
import 'package:sohoj_kart/utils/constants/sizes.dart';
import 'package:sohoj_kart/utils/network/network_manager.dart';
import 'package:sohoj_kart/utils/popups/full_screen_loader.dart';
import 'package:sohoj_kart/utils/popups/loaders.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  final imageLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final hidePassword = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());

  final GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  //Fetched the user record
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
      profileLoading.value = false;
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  //Save User Record From any Registration Provider
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      //First update Rx user and then check data is already stored. If not store the new data
      await fetchUserRecord();
      if (user.value.id.isEmpty) {
        if (userCredential != null) {
          final nameParts =
              UserModel.nameParts(userCredential.user!.displayName ?? '');
          final userName = UserModel.generateUserName(
              userCredential.user!.displayName ?? '');

          //Map Data
          final user = UserModel(
            id: userCredential.user!.uid,
            firstName: nameParts[0],
            lastName: nameParts.length > 1
                ? nameParts.sublist(1).join(' ')
                : nameParts[1],
            userName: userName,
            email: userCredential.user!.email ?? '',
            phoneNumber: userCredential.user!.phoneNumber ?? '',
            profilePicture: userCredential.user!.photoURL ?? '',
          );

          //Save userData
          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      SKLoaders.warningSnackBar(
        title: 'Data Not Saved',
        message:
            'Something went wrong while saving your information. You can re-save your data in your Profile',
      );
    }
  }

  //Delete account warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(SKSizes.md),
        title: 'Delete Account',
        middleText: 'Are you sure you want to delete your account permanently.'
            'This action is not reversible and all of your data will be removed permanently,',
        confirm: ElevatedButton(
          onPressed: () async => _deleteUserAccount(),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            side: const BorderSide(color: Colors.red),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: SKSizes.lg),
            child: Text('Delete'),
          ),
        ),
        cancel: ElevatedButton(
          onPressed: () => Navigator.of(Get.overlayContext!).pop(),
          child: const Text('Cancel'),
        ));
  }

  //Delete User Account
  void _deleteUserAccount() async {
    try {
      //Start Loading
      SKFullScreenLoader.openLoadingDialog(
          'Processing', SKImages.processLottieAnimation);

      //First re-authenticate user
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        //Re verify auth email
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          SKFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          SKFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginForm());
        }
      }
    } catch (e) {
      //Stop Loader
      SKFullScreenLoader.stopLoading();
      SKLoaders.errorSnackBar(
        title: 'On Snap',
        message: 'Something went wrong!. Please try later',
      );
    }
  }

  //Re authenticate user email and password
  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      //Start Loading
      SKFullScreenLoader.openLoadingDialog(
          'Processing', SKImages.processLottieAnimation);

      //Check internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        //Stop Loading
        SKFullScreenLoader.stopLoading();
        return;
      }

      //
      if (!reAuthFormKey.currentState!.validate()) {
        //Stop Loading
        SKFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .reAuthenticateWithEmailAndPassword(
        verifyEmail.text.trim(),
        verifyPassword.text.trim(),
      );
      await AuthenticationRepository.instance.deleteAccount();

      //Stop Loading
      SKFullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      //Stop Loader
      SKFullScreenLoader.stopLoading();
      SKLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  //Upload Profile Image
  uploadUserProfileImage() async {
    try {
      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
        maxHeight: 512,
        maxWidth: 512,
      );
      if (image != null) {
        imageLoading.value = true;
        //Upload Image
        final imageUrl =
            await userRepository.uploadImage('Users/Images/Profile/', image);

        // Update User Image Record
        Map<String, dynamic> json = {'ProfilePicture': imageUrl};
        await userRepository.updateSpecificField(json);

        //Update user record
        user.value.profilePicture = imageUrl;
        user.refresh();

        //Show success message
        SKLoaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your Profile Image has been updated',
        );
      }
    } catch (e) {
      //Show error message
      SKLoaders.errorSnackBar(title: 'On Snap!', message: e.toString());
    }finally{
      imageLoading.value = false;
    }
  }
}
