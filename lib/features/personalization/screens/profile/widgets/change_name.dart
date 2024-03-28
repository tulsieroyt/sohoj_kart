import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sohoj_kart/common/widgets/appbar/appbar.dart';
import 'package:sohoj_kart/features/personalization/controllers/user/update_username_controller.dart';
import 'package:sohoj_kart/utils/constants/sizes.dart';
import 'package:sohoj_kart/utils/constants/text_strings.dart';
import 'package:sohoj_kart/utils/validators/validation.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateUsernameController());
    return Scaffold(
      appBar: SKAppBar(
        showBackArrow: true,
        title: Text(
          'Change Name',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SKSizes.defaultSpace),
          child: Column(
            children: [
              ///Heading
              Text(
                'Use real name for easy verification. This name will appear in several pages',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: SKSizes.spaceBtwSections),

              ///Text Fields and button\
              Form(
                key: controller.updateUserNameFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.firstName,
                      validator: (value) =>
                          SKValidator.validateEmptyText('First Name', value),
                      expands: false,
                      decoration: const InputDecoration(
                        labelText: SKTexts.firstName,
                        prefixIcon: Icon(Iconsax.user),
                      ),
                    ),
                    const SizedBox(height: SKSizes.spaceBetweenInputFields),
                    TextFormField(
                      controller: controller.lastName,
                      validator: (value) =>
                          SKValidator.validateEmptyText('Last Name', value),
                      expands: false,
                      decoration: const InputDecoration(
                        labelText: SKTexts.lastName,
                        prefixIcon: Icon(Iconsax.user),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: SKSizes.spaceBtwSections),

              ///Save Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.updateUserName(),
                  child: const Text('Save'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
