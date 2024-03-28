import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sohoj_kart/common/widgets/appbar/appbar.dart';
import 'package:sohoj_kart/features/personalization/controllers/address/address_controller.dart';
import 'package:sohoj_kart/features/personalization/screens/address/add_new_address_screen.dart';
import 'package:sohoj_kart/features/personalization/screens/address/widgets/single_address.dart';
import 'package:sohoj_kart/utils/constants/colors.dart';
import 'package:sohoj_kart/utils/constants/sizes.dart';
import 'package:sohoj_kart/utils/helpers/cloud_helper_function.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
    return Scaffold(
      appBar: SKAppBar(
        showBackArrow: true,
        title: Text(
          'Addresses',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SKSizes.defaultSpace),
          child: Obx(
            () => FutureBuilder(
                //Use key to trigger refresh
                key: Key(controller.refreshData.value.toString()),
                future: controller.getUsersAllAddresses(),
                builder: (context, snapshot) {
                  ///Handle Error, No Record and Error Message
                  final response =
                      SKCloudHelperFunctions.checkMultipleRecordState(
                          snapshot: snapshot);

                  if (response != null) return response;

                  ///Record Found
                  final addresses = snapshot.data!;

                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: addresses.length,
                    separatorBuilder: (_, __) =>
                        const SizedBox(height: SKSizes.sm / 2),
                    itemBuilder: (_, index) => SKSingleAddress(
                      address: addresses[index],
                      onTap: () => controller.selectAddress(addresses[index]),
                    ),
                  );
                }),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        child: const Icon(Iconsax.add, color: SKColors.white),
      ),
    );
  }
}
