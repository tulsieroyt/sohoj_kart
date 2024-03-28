import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sohoj_kart/common/widgets/appbar/appbar.dart';
import 'package:sohoj_kart/features/personalization/controllers/user/user_controller.dart';
import 'package:sohoj_kart/utils/constants/sizes.dart';
import 'package:sohoj_kart/utils/constants/text_strings.dart';
import 'package:sohoj_kart/utils/validators/validation.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const SKAppBar(title: Text('Re-Authentication User')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SKSizes.defaultSpace),
          child: Form(
            key: controller.reAuthFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///Email
                TextFormField(
                  controller: controller.verifyEmail,
                  validator: SKValidator.validateEmail,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.direct_right),
                    labelText: SKTexts.email,
                  ),
                ),
                const SizedBox(height: SKSizes.spaceBetweenInputFields),

                ///Password
                Obx(
                  () => TextFormField(
                    controller: controller.verifyPassword,
                    obscureText: controller.hidePassword.value,
                    validator: (value) =>
                        SKValidator.validateEmptyText('Password', value),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Iconsax.password_check),
                      labelText: SKTexts.password,
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Iconsax.eye),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: SKSizes.spaceBtwSections),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () =>
                        controller.reAuthenticateEmailAndPasswordUser(),
                    child: const Text('Verify'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
