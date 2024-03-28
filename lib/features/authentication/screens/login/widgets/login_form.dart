import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sohoj_kart/features/authentication/screens/password_configuration/forgot_password_screen.dart';
import 'package:sohoj_kart/features/authentication/screens/signup/signup.dart';
import 'package:sohoj_kart/utils/constants/sizes.dart';
import 'package:sohoj_kart/utils/constants/text_strings.dart';
import 'package:sohoj_kart/utils/validators/validation.dart';

import '../../../controllers/login/login_controller.dart';

class SKLoginForm extends StatelessWidget {
  const SKLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: SKSizes.spaceBtwSections,
        ),
        child: Column(
          children: [
            /// -- For Email
            TextFormField(
              controller: controller.email,
              validator: (value) => SKValidator.validateEmail(value),
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: SKTexts.email,
              ),
            ),
            const SizedBox(
              height: SKSizes.spaceBetweenInputFields,
            ),

            /// -- For Password
            Obx(
              () => TextFormField(
                validator: (value) => SKValidator.validatePassword(value),
                controller: controller.password,
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  labelText: SKTexts.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value =
                        !controller.hidePassword.value,
                    icon: Icon(controller.hidePassword.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: SKSizes.spaceBetweenInputFields / 2,
            ),

            ///Remember me and Forgot Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: (value) => controller.rememberMe.value =
                            !controller.rememberMe.value,
                      ),
                    ),
                    const Text(SKTexts.rememberMe),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    Get.to(() => const ForgotPasswordScreen());
                  },
                  child: const Text(SKTexts.forgotPassword),
                ),
              ],
            ),
            const SizedBox(
              height: SKSizes.spaceBtwSections,
            ),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.emailAndPasswordSignIn(),
                child: const Text(SKTexts.signIn),
              ),
            ),
            const SizedBox(
              height: SKSizes.spaceBtwItems,
            ),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Get.to(() => const SignupScreen());
                },
                child: const Text(SKTexts.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
