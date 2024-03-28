import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sohoj_kart/common/widgets/appbar/appbar.dart';
import 'package:sohoj_kart/features/personalization/controllers/address/address_controller.dart';
import 'package:sohoj_kart/utils/constants/sizes.dart';
import 'package:sohoj_kart/utils/validators/validation.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    return Scaffold(
      appBar: const SKAppBar(
        showBackArrow: true,
        title: Text('Add New Address'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SKSizes.defaultSpace),
          child: Form(
            key: controller.addressFormKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: controller.name,
                  validator: (value) =>
                      SKValidator.validateEmptyText('Name', value),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: 'Name',
                  ),
                ),
                const SizedBox(height: SKSizes.spaceBetweenInputFields),
                TextFormField(
                  controller: controller.phoneNumber,
                  validator: (value) =>
                      SKValidator.validateEmptyText('Phone Number', value),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.mobile),
                    labelText: 'Phone Number',
                  ),
                ),
                const SizedBox(height: SKSizes.spaceBetweenInputFields),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.street,
                        validator: (value) =>
                            SKValidator.validateEmptyText('Street', value),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.building_31),
                          labelText: 'Street',
                        ),
                      ),
                    ),
                    const SizedBox(width: SKSizes.spaceBetweenInputFields),
                    Expanded(
                      child: TextFormField(
                        controller: controller.postalCode,
                        validator: (value) =>
                            SKValidator.validateEmptyText('Postal Code', value),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.code),
                          labelText: 'Postal Code',
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: SKSizes.spaceBetweenInputFields),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.city,
                        validator: (value) =>
                            SKValidator.validateEmptyText('City', value),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.building),
                          labelText: 'City',
                        ),
                      ),
                    ),
                    const SizedBox(width: SKSizes.spaceBetweenInputFields),
                    Expanded(
                      child: TextFormField(
                        controller: controller.state,
                        validator: (value) =>
                            SKValidator.validateEmptyText('State', value),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.activity),
                          labelText: 'State',
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: SKSizes.spaceBetweenInputFields),
                TextFormField(
                  controller: controller.country,
                  validator: (value) =>
                      SKValidator.validateEmptyText('Country', value),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.global),
                    labelText: 'Country',
                  ),
                ),
                const SizedBox(height: SKSizes.defaultSpace),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => controller.addNewAddress(),
                      child: const Text('Save')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
