import 'package:store_app/imports.dart';

class CartController extends GetxController {
  var cart = List<CartItem>().obs;
  @override
  void onInit() {
    // TODO: implement onInit
    fetchCart();
    super.onInit();
  }

  void fetchCart() async {
    cart.value =
        await ApiServices.getCart(Get.find<UserController>().user.value.cart);
  }

  void removeItem(item) async {
    Get.find<UserController>().removeItemFromCart(item);
    fetchCart();
    Get.find<UserController>().updateUserInfo();
  }

  void removeSelectedItem() async {
    cart.value.forEach((element) {
      if (element.isChosen == true)
        Get.find<UserController>().removeItemFromCart(element);
    });
    fetchCart();
    Get.find<UserController>().updateUserInfo();
  }

  void addItem(item) async {
    Get.find<UserController>().addItemToCart(item);
    fetchCart();
    Get.find<UserController>().updateUserInfo();
  }

  void toggleChosenCheckBox(productId, value) {
    Get.find<UserController>().toggleChosenCheckbox(productId, value);
    fetchCart();
    Get.find<UserController>().updateUserInfo();
  }

  void toggleAllCheckBox(value) {
    cart.forEach((element) {
      Get.find<UserController>()
          .toggleChosenCheckbox(element.product.id, value);
    });
    fetchCart();
    Get.find<UserController>().updateUserInfo();
  }

  void changeProductQuantity(productId, value) {
    Get.find<UserController>().changeProductQuantity(productId, value);
    fetchCart();
    Get.find<UserController>().updateUserInfo();
  }

  void clear() {
    cart.value = [];
  }
}
