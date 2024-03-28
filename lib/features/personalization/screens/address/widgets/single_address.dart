import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sohoj_kart/features/personalization/controllers/address/address_controller.dart';
import 'package:sohoj_kart/features/personalization/models/address_model.dart';
import 'package:sohoj_kart/utils/constants/colors.dart';
import 'package:sohoj_kart/utils/constants/sizes.dart';
import 'package:sohoj_kart/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/custom_shapes/container/rounded_container.dart';

class SKSingleAddress extends StatelessWidget {
  const SKSingleAddress({
    super.key,
    required this.address,
    required this.onTap,
  });

  final AddressModel address;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    final darkMode = SKHelperFunctions.isDarkMode(context);
    return Obx(
      () {
        final selectedAddressId = controller.selectedAddress.value.id;
        final selectedAddress = selectedAddressId == address.id;
        return InkWell(
          onTap: onTap,
          child: SKRoundedContainer(
            width: double.infinity,
            showBorder: true,
            padding: const EdgeInsets.all(SKSizes.md),
            backgroundColor: selectedAddress
                ? SKColors.primary.withOpacity(0.6)
                : Colors.transparent,
            borderColor: selectedAddress
                ? Colors.transparent
                : darkMode
                    ? SKColors.darkerGrey
                    : SKColors.grey,
            margin: const EdgeInsets.only(bottom: SKSizes.spaceBtwItems),
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  right: 5,
                  child: Icon(
                    selectedAddress ? Iconsax.tick_circle5 : null,
                    color: selectedAddress
                        ? darkMode
                            ? SKColors.light
                            : SKColors.dark
                        : null,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      address.name,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.titleLarge,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: SKSizes.sm / 2),
                    Text(
                      address.formattedPhoneNumber,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: SKSizes.sm / 2),
                    Text(
                      address.toString(),
                      softWrap: true,
                    ),

                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
