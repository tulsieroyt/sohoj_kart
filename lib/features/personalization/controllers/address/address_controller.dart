import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sohoj_kart/common/widgets/texts/section_heading.dart';
import 'package:sohoj_kart/data/repositories/address/address_repository.dart';
import 'package:sohoj_kart/features/personalization/models/address_model.dart';
import 'package:sohoj_kart/features/personalization/screens/address/widgets/single_address.dart';
import 'package:sohoj_kart/utils/constants/image_strings.dart';
import 'package:sohoj_kart/utils/constants/sizes.dart';
import 'package:sohoj_kart/utils/helpers/cloud_helper_function.dart';
import 'package:sohoj_kart/utils/network/network_manager.dart';
import 'package:sohoj_kart/utils/popups/full_screen_loader.dart';
import 'package:sohoj_kart/utils/popups/loaders.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  ///Variable for address Form
  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final postalCode = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final country = TextEditingController();
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

  RxBool refreshData = true.obs;
  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  final addressRepository = Get.put(AddressRepository());

  /// Fetch all user specific address
  Future<List<AddressModel>> getUsersAllAddresses() async {
    try {
      final address = await addressRepository.fetchUserAddress();

      selectedAddress.value = address.firstWhere(
          (element) => element.selectedAddress,
          orElse: () => AddressModel.empty());

      return address;
    } catch (e) {
      SKLoaders.errorSnackBar(
          title: 'Address not Found 1', message: e.toString());
      return [];
    }
  }

  Future selectAddress(AddressModel newSelectedAddress) async {
    try {
      //Clear the selected filed
      if (selectedAddress.value.id.isNotEmpty) {
        await addressRepository.updateSelectedField(
            selectedAddress.value.id, false);
      }

      //Assign selected address
      newSelectedAddress.selectedAddress = true;
      selectedAddress.value = newSelectedAddress;

      //Set the selected field to true for the newly selected address
      await addressRepository.updateSelectedField(
          selectedAddress.value.id, true);

      Get.back();
    } catch (e) {
      SKLoaders.errorSnackBar(
          title: 'Error in selection', message: e.toString());
    }
  }

  ///Add new Address
  Future addNewAddress() async {
    try {
      //Start Loading
      SKFullScreenLoader.openLoadingDialog(
          'Storing Address...', SKImages.processLottieAnimation);

      //Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        SKFullScreenLoader.stopLoading();
        return;
      }

      //Form Validation
      if (!addressFormKey.currentState!.validate()) {
        SKFullScreenLoader.stopLoading();
        return;
      }

      //Save Address Data
      final address = AddressModel(
        id: '',
        name: name.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        street: street.text.trim(),
        city: city.text.trim(),
        state: state.text.trim(),
        postalCode: postalCode.text.trim(),
        country: country.text.trim(),
        selectedAddress: true,
      );

      final id = await addressRepository.addAddress(address);

      //Update Selected Address Status
      address.id = id;
      await selectAddress(address);

      //Remove Loader
      SKFullScreenLoader.stopLoading();

      //Show Success Message
      SKLoaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your Address has been saved successfully');

      //Refresh data
      refreshData.toggle();

      //Reset fields
      resetFormFields();

      //Redirect
      Navigator.of(Get.context!).pop();
    } catch (e) {
      //Remove Loader
      SKFullScreenLoader.stopLoading();
      SKLoaders.errorSnackBar(title: 'On Snap!', message: 'Address not found');
    }
  }

  ///Show Addresses ModalBottomSheet at Checkout
  Future<dynamic> selectNewAddressPopup(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (_) => Container(
              padding: const EdgeInsets.all(SKSizes.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SKSectionHeading(
                      sectionText: 'Select Address', showButton: false),
                  FutureBuilder(
                      future: getUsersAllAddresses(),
                      builder: (_, snapshot) {
                        ///Helper function, Handle Loader, No record or error message
                        final response =
                            SKCloudHelperFunctions.checkMultipleRecordState(
                                snapshot: snapshot);
                        if (response != null) return response;
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (_, index) => SKSingleAddress(
                                address: snapshot.data![index],
                                onTap: () async {
                                  await selectAddress(snapshot.data![index]);
                                }));
                      })
                ],
              ),
            ));
  }

  /// Function to reset the form field
  void resetFormFields() {
    name.clear();
    phoneNumber.clear();
    street.clear();
    postalCode.clear();
    city.clear();
    state.clear();
    state.clear();
    country.clear();
    addressFormKey.currentState?.reset();
  }
}
