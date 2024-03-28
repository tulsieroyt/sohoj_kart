import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sohoj_kart/features/authentication/controllers/forgot_password/forgot_password_controller.dart';
import 'package:sohoj_kart/features/authentication/screens/login/login.dart';
import 'package:sohoj_kart/utils/constants/image_strings.dart';
import 'package:sohoj_kart/utils/constants/sizes.dart';
import 'package:sohoj_kart/utils/constants/text_strings.dart';
import 'package:sohoj_kart/utils/helpers/helper_functions.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SKSizes.defaultSpace),
          child: Column(
            children: [
              ///Successful icon
              Center(
                child: Image(
                  image: const AssetImage(SKImages.successImage),
                  width: SKHelperFunctions.screenWidth() * 0.2,
                ),
              ),
              const SizedBox(height: SKSizes.spaceBtwSections),

              /// Email Title and Subtitle
              Text(
                email,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              Text(
                SKTexts.changeYourPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: SKSizes.spaceBtwSections),
              Text(
                SKTexts.changeYourPasswordSubTitle,
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: SKSizes.spaceBtwSections),

              /// Done Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.offAll(()=> const LoginScreen()),
                  child: const Text(SKTexts.done),
                ),
              ),
              const SizedBox(height: SKSizes.spaceBtwSections),

              /// Resent email Button
              TextButton(
                onPressed: ()=> ForgotPasswordController.instance.resendPasswordResetEmail(email),
                child: const Text(SKTexts.resendEmail),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
