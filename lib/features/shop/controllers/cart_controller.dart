import 'package:get/get.dart';
import 'package:sohoj_kart/features/shop/controllers/product/variation_controller.dart';
import 'package:sohoj_kart/features/shop/models/cart_item_model.dart';
import 'package:sohoj_kart/features/shop/models/products/product_model.dart';
import 'package:sohoj_kart/utils/constants/enums.dart';
import 'package:sohoj_kart/utils/local_storage/storage_utility.dart';
import 'package:sohoj_kart/utils/popups/loaders.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  ///Variable
  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  final variationController = VariationController.instance;

  CartController() {
    loadCartItems();
  }

  //Add item in the cart
  void addToCart(ProductModel product) {
    //Quantity Check
    if (productQuantityInCart.value < 1) {
      SKLoaders.customToasts(message: 'Select Quantity');
      return;
    }

    //Variation Check
    if (product.productType == ProductType.variable.toString() &&
        variationController.selectedVariation.value.id.isEmpty) {
      SKLoaders.customToasts(message: 'Select Variation');
      return;
    }

    //Out of Stock Status
    if (product.productType == ProductType.variable.toString()) {
      if (variationController.selectedVariation.value.stock < 1) {
        SKLoaders.warningSnackBar(
          title: 'Oh Snap',
          message: 'Selected Variation is out of stock',
        );
        return;
      }
    } else {
      if (product.stock < 1) {
        SKLoaders.warningSnackBar(
          title: 'Oh Snap',
          message: 'Selected Variation is out of stock',
        );
        return;
      }
    }
    //Convert the ProductModel to a CategoryModel with the giver quantity
    final selectedItem =
        convertToCartItem(product, productQuantityInCart.value);

    //Check if already added in the cart
    int index = cartItems.indexWhere((cartItem) =>
        cartItem.productId == selectedItem.productId &&
        cartItem.variationId == selectedItem.variationId);

    if (index >= 0) {
      //The quantity is already added or Updated/Removed
      cartItems[index].quantity = selectedItem.quantity;
    } else {
      cartItems.add(selectedItem);
    }

    //Update cart
    updateCart();
    SKLoaders.customToasts(message: 'Your Product has been added to the cart');
  }

  ///Add one item to the cart
  void addOneItemToCart(CartItemModel item) {
    int index = cartItems.indexWhere((cartItem) =>
        cartItem.productId == item.productId &&
        cartItem.variationId == item.variationId);

    if (index >= 0) {
      cartItems[index].quantity += 1;
    } else {
      cartItems.add(item);
    }

    updateCart();
  }

  void removeOneItemFromTheCart(CartItemModel item) {
    int index = cartItems.indexWhere((cartItem) =>
        cartItem.productId == item.productId &&
        cartItem.variationId == item.variationId);

    if (index >= 0) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity -= 1;
      } else {
        //Show dialog before completely removing
        cartItems[index].quantity == 1
            ? removeFromCartDialog(index)
            : cartItems.removeAt(index);
      }
      updateCart();
    }
  }

  //To show the last item
  void removeFromCartDialog(int index) {
    Get.defaultDialog(
      title: 'Remove Product',
      middleText: 'Are you sure you want to remove the product',
      onConfirm: () {
        //Remove the item from the cart and
        cartItems.removeAt(index);
        updateCart();
        SKLoaders.customToasts(message: 'Product removed from the cart');
        Get.back();
      },
      onCancel: () => () => Get.back(),
    );
  }

  ///This function convert a ProductModel to a CartItemModel
  CartItemModel convertToCartItem(ProductModel product, int quantity) {
    if (product.productType == ProductType.single.toString()) {
      //Reset Variation in case of single product type
      variationController.resetSelectedAttributes();
    }

    final variation = variationController.selectedVariation.value;
    final isVariation = variation.id.isNotEmpty;

    final price = isVariation
        ? variation.salePrice > 00
            ? variation.salePrice
            : variation.price
        : product.salePrice > 0.0
            ? product.salePrice
            : product.price;

    return CartItemModel(
      productId: product.id,
      title: product.title,
      price: price,
      quantity: quantity,
      variationId: variation.id,
      image: isVariation ? variation.image : product.thumbnail,
      brandName: product.brand != null ? product.brand!.name : '',
      selectedVariation: isVariation ? variation.attributeValues : null,
    );
  }

  ///Update Cart Values
  updateCart() {
    updateCartTotals();
    saveCartItems();
    cartItems.refresh();
  }

  ///Update Cart totals
  void updateCartTotals() {
    double calculatedTotalPrice = 0.0;
    int calculatedNoOfItems = 0;
    for (var item in cartItems) {
      calculatedTotalPrice += (item.price) * item.quantity.toDouble();
      calculatedNoOfItems += item.quantity;
    }
    totalCartPrice.value = calculatedTotalPrice;
    noOfCartItems.value = calculatedNoOfItems;
  }

  ///Save cart items
  void saveCartItems() {
    final cartItemStrings = cartItems.map((item) => item.toJson()).toList();
    SKLocalStorage.instance().saveData('cartItems', cartItemStrings);
  }

  //Load Cart Items
  void loadCartItems() {
    final cartItemString =
        SKLocalStorage.instance().readData<List<dynamic>>('cartItems');
    if (cartItemString != null) {
      cartItems.assignAll(cartItemString
          .map((item) => CartItemModel.fromJson(item as Map<String, dynamic>)));
      updateCartTotals();
    }
  }

  int getProductQuantityInCart(String productId) {
    final foundItem = cartItems
        .where((item) => item.productId == productId)
        .fold(0, (previousValue, element) => previousValue + element.quantity);
    return foundItem;
  }

  int getVariationQuantityInCart(String productId, String variationId) {
    final foundItem = cartItems.firstWhere(
        (item) =>
            item.productId == productId && item.variationId == variationId,
        orElse: () => CartItemModel.empty());
    return foundItem.quantity;
  }

  void clearCart() {
    productQuantityInCart.value = 0;
    cartItems.clear();
    updateCart();
  }

  /// -- Initialize already added item's count in the cart
  void updateAlreadyAddedProductCount(ProductModel product) {
    //If product has no variation then calculate cartEntries and display total number
    //Else make a default entities to 0 and show cart Entities when variation is selected
    if (product.productType == ProductType.single.toString()) {
      productQuantityInCart.value = getProductQuantityInCart(product.id);
    } else {
      //Get the variation if any
      final variationId = variationController.selectedVariation.value.id;
      if (variationId.isNotEmpty) {
        productQuantityInCart.value =
            getVariationQuantityInCart(product.id, variationId);
      } else {
        productQuantityInCart.value = 0;
      }
    }
  }
}
