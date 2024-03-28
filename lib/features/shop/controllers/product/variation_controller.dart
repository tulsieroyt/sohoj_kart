import 'package:get/get.dart';
import 'package:sohoj_kart/features/shop/controllers/cart_controller.dart';
import 'package:sohoj_kart/features/shop/controllers/product/images_controller.dart';
import 'package:sohoj_kart/features/shop/models/products/product_model.dart';
import 'package:sohoj_kart/features/shop/models/products/product_variation_model.dart';

class VariationController extends GetxController {
  static VariationController get instance => Get.find();

  ///Variable
  RxMap selectedAttributes = {}.obs;
  RxString variationStockStatus = ''.obs;
  Rx<ProductVariationModel> selectedVariation =
      ProductVariationModel.empty().obs;

  ///Select Attribute and Variations
  void onAttributesSelected(
      ProductModel product, attributeName, attributeValue) {
    //When attribute is selected we will first add that attributes to the selectedAttributes
    final selectedAttributes =
        Map<String, dynamic>.from(this.selectedAttributes);

    selectedAttributes[attributeName] = attributeValue;
    this.selectedAttributes[attributeName] = attributeValue;

    final selectedVariation = product.productVariations!.firstWhere(
        (variation) =>
            _isSameAttributes(variation.attributeValues, selectedAttributes),
        orElse: () => ProductVariationModel.empty());

    //Show the selected variation as a main image
    if (selectedVariation.image.isNotEmpty) {
      ImagesController.instance.selectedProductImage.value =
          selectedVariation.image;
    }

    //SHow selected variation quantity already in the cart
    if (selectedVariation.id.isNotEmpty) {
      final cartController = CartController.instance;
      cartController.productQuantityInCart.value = cartController
          .getVariationQuantityInCart(product.id, selectedVariation.id);
    }

    //Assign selected Variations
    this.selectedVariation.value = selectedVariation;

    //Update selected product variation status
    getProductVariationStockStatus();
  }

  ///Check Selected Variations match any selected
  bool _isSameAttributes(
    Map<String, dynamic> variationAttributes,
    Map<String, dynamic> selectedAttributes,
  ) {
    //If selected attributes contains 3 attributes and current variation contains 2 then return
    if (variationAttributes.length != selectedAttributes.length) return false;

    //If any of the attributes is the different than return
    for (final key in variationAttributes.keys) {
      //Attributes[key] = value which could be [Green, Small, Cotton] etc.
      if (variationAttributes[key] != selectedAttributes[key]) return false;
    }
    return true;
  }

  ///Check Attribute availability / Stock in variation
  Set<String?> getAttributesAvailabilityInVariation(
      List<ProductVariationModel> variations, String attributeName) {
    //Pass the variation to check which attributes are available and stock is not 0
    final availableVariationAttributeValues = variations
        .where((variation) =>
            variation.attributeValues[attributeName] != null &&
            variation.attributeValues[attributeName]!.isNotEmpty &&
            variation.stock > 0)
        //Fetch all non empty attribute variations
        .map((variation) => variation.attributeValues[attributeName])
        .toSet();

    return availableVariationAttributeValues;
  }

  String getVariationPrice() {
    return (selectedVariation.value.salePrice > 0
            ? selectedVariation.value.salePrice
            : selectedVariation.value.price)
        .toString();
  }

  ///Check Product variation Stock Status
  void getProductVariationStockStatus() {
    variationStockStatus.value =
        selectedVariation.value.stock > 0 ? 'In Stock' : 'Out of Stock';
  }

  ///Reset Selected Attributes when switching
  void resetSelectedAttributes() {
    selectedAttributes.clear();
    variationStockStatus.value = '';
    selectedVariation.value = ProductVariationModel.empty();
  }
}
