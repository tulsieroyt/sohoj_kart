import 'package:flutter/material.dart';
import 'package:sohoj_kart/features/personalization/controllers/address/address_controller.dart';

import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/sizes.dart';

class SKBillingAddressSection extends StatelessWidget {
  const SKBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final addressController = AddressController.instance;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SKSectionHeading(
          sectionText: 'Shipping Address',
          buttonText: 'Change',
          onPressed: () => addressController.selectNewAddressPopup(context),
        ),
        const SizedBox(height: SKSizes.spaceBtwItems / 2),
        addressController.selectedAddress.value.id.isNotEmpty
            ? Column(
                children: [
                  Text(
                    addressController.selectedAddress.value.name,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: SKSizes.spaceBtwItems / 2),
                  Row(
                    children: [
                      const Icon(Icons.phone, color: Colors.grey, size: 16),
                      const SizedBox(width: SKSizes.spaceBtwItems),
                      Text(
                        addressController.selectedAddress.value.phoneNumber,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  const SizedBox(height: SKSizes.spaceBtwItems / 2),
                  Row(
                    children: [
                      const Icon(Icons.location_history,
                          color: Colors.grey, size: 16),
                      const SizedBox(width: SKSizes.spaceBtwItems),
                      Expanded(
                        child: Text(
                          addressController
                              .selectedAddress.value.postalCode,
                          style: Theme.of(context).textTheme.bodyMedium,
                          softWrap: true,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            : Text('Select Address',
                style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
