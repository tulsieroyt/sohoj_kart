import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sohoj_kart/features/authentication/controllers/forgot_password/forgot_password_controller.dart';
import 'package:sohoj_kart/utils/constants/sizes.dart';
import 'package:sohoj_kart/utils/constants/text_strings.dart';
import 'package:sohoj_kart/utils/validators/validation.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgotPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SKSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                SKTexts.forgotPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: SKSizes.spaceBtwItems),
              Text(
                SKTexts.forgotPasswordSubTitle,
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: SKSizes.spaceBtwSections * 2),

              ///TextField
              Form(
                key: controller.forgotPasswordFormKey,
                child: TextFormField(
                  controller: controller.email,
                  validator: (value) => SKValidator.validateEmail(value),
                  decoration: const InputDecoration(
                    labelText: SKTexts.email,
                    prefixIcon: Icon(Iconsax.direct_right),
                  ),
                ),
              ),
              const SizedBox(height: SKSizes.spaceBtwSections),

              ///Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.sendPasswordResetEmail(),
                  child: const Text(SKTexts.submit),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
