import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sohoj_kart/features/authentication/controllers/signup/signup_controller.dart';
import 'package:sohoj_kart/features/authentication/screens/signup/widgets/terms_and_condition_checkbox.dart';
import 'package:sohoj_kart/utils/constants/sizes.dart';
import 'package:sohoj_kart/utils/constants/text_strings.dart';
import 'package:sohoj_kart/utils/validators/validation.dart';

class SKSignUpForm extends StatelessWidget {
  const SKSignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signUpFormKey,
      child: Column(
        children: [
          /// First & last name
          Row(
            children: [
              ///First Name
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) =>
                      SKValidator.validateEmptyText('First Name', value),
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: SKTexts.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              const SizedBox(width: SKSizes.spaceBetweenInputFields),

              ///Last Name
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) =>
                      SKValidator.validateEmptyText('Last Name', value),
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: SKTexts.lastName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: SKSizes.spaceBetweenInputFields),

          ///User name
          TextFormField(
            controller: controller.userName,
            validator: (value) =>
                SKValidator.validateEmptyText('Username', value),
            expands: false,
            decoration: const InputDecoration(
              labelText: SKTexts.userName,
              prefixIcon: Icon(Iconsax.user),
            ),
          ),

          const SizedBox(height: SKSizes.spaceBetweenInputFields),

          ///Email
          TextFormField(
            controller: controller.email,
            validator: (value) => SKValidator.validateEmail(value),
            expands: false,
            decoration: const InputDecoration(
              labelText: SKTexts.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),

          const SizedBox(height: SKSizes.spaceBetweenInputFields),

          ///Phone number
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => SKValidator.validatePhoneNumber(value),
            expands: false,
            decoration: const InputDecoration(
              labelText: SKTexts.phoneNo,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),

          const SizedBox(height: SKSizes.spaceBetweenInputFields),

          ///Password
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

          const SizedBox(height: SKSizes.spaceBetweenInputFields),

          ///Terms&Conditions Checkbox
          const SKTermsAndConditionCheckbox(),
          const SizedBox(
            height: SKSizes.spaceBtwSections,
          ),

          ///Sign Up Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.signup(),
              child: const Text(SKTexts.createAccount),
            ),
          )
        ],
      ),
    );
  }
}
