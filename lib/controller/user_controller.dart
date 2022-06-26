import 'package:store_app/imports.dart';

class UserController extends GetxController {
  var user = User().obs;

  @override
  onInit() async {
    user.value = User();
    super.onInit();
  }

  setUserInfo() async {
    if (Get.find<AuthController>().token.value != '') {
      var info = await ApiServices.getInfoByToken(
          Get.find<AuthController>().token.value);
      if (info != null) {
        print("info isn't null");
        user.value = info;
      }
    }
  }

  removeItemFromCart(item) {
    user.value.cart
        .removeWhere((element) => element.productId == item.product.id);
  }

  addItemToCart(item) {
    user.value.cart.add(
      Cart(productId: item.product.id, quantity: 1, isChosen: false),
    );
  }

  addNewLocation(Location newLocation) async {
    user.value.locations.add(newLocation);
    await updateUserInfo();
  }

  removeLocation(Location location) {
    user.value.locations.remove(location);
    updateUserInfo();
  }

  toggleChosenCheckbox(productId, value) {
    user.value.cart
        .firstWhere((element) => element.productId == productId)
        .isChosen = value;
  }

  changeProductQuantity(productId, value) {
    user.value.cart
        .firstWhere((element) => element.productId == productId)
        .quantity = value;
  }

  updateUserFromProfile(data) async {
    user.value.userName = data['userName'];
    user.value.birthday = data['birthday'];
    user.value.gender = data['gender'];
    user.value.address = data['address'];
    user.value.phoneNumber = data['phoneNumber'];
    updateUserInfo();
  }

  updateUserInfo() async {
    var data = {
      'userName': user.value.userName,
      'birthday': user.value.birthday,
      'gender': user.value.gender,
      'address': user.value.address,
      'phoneNumber': user.value.phoneNumber,
      'cart': json.encode(user.value.cart),
      'loves': json.encode(user.value.loves),
      'locations': json.encode(user.value.locations),
    };
    await ApiServices.updateUser(data, user.value.id);
  }

  clear() {
    user.value = User();
  }
}
