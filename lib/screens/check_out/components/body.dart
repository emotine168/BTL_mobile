import 'package:store_app/imports.dart';

class Body extends StatelessWidget {
  var _checkOutController = Get.put(CheckOutController());

  var text = "some text";

  //press confirm
  sendOrder({subTotal, shipping}) async {
    var data = {
      'user': Get.find<UserController>().user.value.id,
      'items': json.encode(List.generate(
          _checkOutController.items.value.length,
          (index) => {
                "productId": _checkOutController.items.value[index].product.id,
                "quantity": _checkOutController.items.value[index].numOfItem,
              })),
      'discount': _checkOutController.discountSelected.value.name,
      'shippingAddress':
          json.encode(_checkOutController.locationSelected.value.toJson()),
      'text': text,
      'subTotal': numberToPrice(subTotal),
      'total': numberToPrice(subTotal + shipping),
      'shipping': numberToPrice(shipping),
      'orderTime': DateTime.now().toString(),
    };
    var res = await ApiServices.sendOrder(data);
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SingleChildScrollView(
        child: Column(
          children: [
            LocationSelection(
                locationSelected: _checkOutController.locationSelected.value),
            ProductList(checkOutController: _checkOutController),
            ShippingFee(checkOutController: _checkOutController),
            // text
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]),
              ),
              child: Row(
                children: [
                  Text(
                    "Text:",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ],
              ),
            ),
            ProductPriceTotal(checkOutController: _checkOutController),
            DiscountSelection(
              discountList: _checkOutController.discountList,
              discountSelected: _checkOutController.discountSelected.value,
            ),
            CheckOutSumary(checkOutController: _checkOutController),
            SizedBox(height: 20),
            SizedBox(
              width: SizeConfig.screenWidth * 0.6,
              child: DefaultButton(
                text: "Confirm",
                press: () {
                  if (1 == 1) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Confirm"),
                        actions: [
                          FlatButton(
                              onPressed: () async {
                                var res = await sendOrder(
                                    subTotal: _checkOutController.total.value,
                                    shipping: _checkOutController
                                        .shippingFeeAfterDiscount.value);

                                if (res != null) {
                                  Get.find<CartController>()
                                      .removeSelectedItem();

                                  Get.to(() => OrderSuccessScreen());
                                }
                              },
                              child: Text("Yes")),
                          FlatButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("No")),
                        ],
                      ),
                    );
                  } else {
                    //do sth
                  }
                },
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
