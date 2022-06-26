import 'package:store_app/imports.dart';

class CheckOutController extends GetxController {
  var discountList = List<Discount>().obs;
  var discountSelected = Discount().obs;
  var locationSelected = Location().obs;
  var items = List<CartItem>().obs;
  var shippingFee = 0.obs;
  var shippingFeeAfterDiscount = 0.obs;
  var total = 0.obs;
  var totalAfterDiscount = 0.obs;
  var finalTotal = 0.obs;

  @override
  void onInit() async {
    // TODO: implement onInit

    await fetchDiscountList();
    total.value = 0;
    totalAfterDiscount.value = 0;
    if (Get.find<UserController>().user.value.locations.length != 0) {
      locationSelected.value =
          Get.find<UserController>().user.value.locations[0];
      shippingFee.value = distanceToMoney(locationSelected.value.length);
      shippingFeeAfterDiscount.value =
          distanceToMoney(locationSelected.value.length);
    }

    items.value = Get.find<CartController>()
        .cart
        .value
        .where((element) => element.isChosen == true)
        .toList();
    items.forEach((element) {
      total.value += priceToNumber(element.product.price) * element.numOfItem;
      totalAfterDiscount.value = total.value;
    });
    if (discountList.value.length != 0) {
      setDiscount(discountList.value[0]);
    }
    super.onInit();
  }

  fetchDiscountList() async {
    discountList.value = await ApiServices.fetchDiscounts();
  }

  setDiscount(Discount discount) {
    discountSelected.value = discount;
    switch (discount.type) {
      case 'value':
        print("discount value selected");
        var value = priceToNumber(discount.value);
        shippingFeeAfterDiscount.value = shippingFee.value;
        totalAfterDiscount.value = 0;
        totalAfterDiscount.value = total.value - value;
        break;
      case 'percent':
        print("discount percent selected");
        var value = percentToNumber(discount.value);
        shippingFeeAfterDiscount.value = shippingFee.value;
        totalAfterDiscount.value = 0;
        totalAfterDiscount.value = total.value - (total.value * value).toInt();
        break;
      case 'shipping':
        print("discount shipping selected");
        var value = percentToNumber(discount.value);
        totalAfterDiscount.value = total.value;
        shippingFeeAfterDiscount.value = 0;
        shippingFeeAfterDiscount.value =
            shippingFee.value - (shippingFee.value * value).toInt();
        break;
      default:
        break;
    }
  }

  setLocation(Location location) {
    locationSelected.value = location;
    shippingFee.value = distanceToMoney(locationSelected.value.length);
    shippingFeeAfterDiscount.value =
        distanceToMoney(locationSelected.value.length);
    setDiscount(discountSelected.value);
  }
}
