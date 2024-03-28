import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sohoj_kart/data/repositories/authentication/authentication_repository.dart';
import 'package:sohoj_kart/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:sohoj_kart/utils/constants/image_strings.dart';
import 'package:sohoj_kart/utils/constants/sizes.dart';
import 'package:sohoj_kart/utils/constants/text_strings.dart';
import 'package:sohoj_kart/utils/helpers/helper_functions.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => AuthenticationRepository.instance.logout(),
            icon: const Icon(CupertinoIcons.clear),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SKSizes.defaultSpace),
          child: Column(
            children: [
              ///Images
              Center(
                child: Image(
                  image: const AssetImage(SKImages.deliveredEmailAnimations),
                  width: SKHelperFunctions.screenWidth() * 0.2,
                ),
              ),
              const SizedBox(height: SKSizes.spaceBtwSections),

              ///Title and Subtitle
              Text(
                SKTexts.confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: SKSizes.spaceBtwSections),
              Text(
                email ?? '',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: SKSizes.spaceBtwSections),
              Text(
                SKTexts.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: SKSizes.spaceBtwSections),

              ///Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.checkEmailVerificationStatus(),
                  child: const Text(SKTexts.skContinue),
                ),
              ),

              const SizedBox(height: SKSizes.spaceBtwSections),
              TextButton(
                onPressed: () => controller.sendEmailVerification(),
                child: const Text(SKTexts.resendEmail),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
