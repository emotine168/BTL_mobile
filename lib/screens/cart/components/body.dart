import 'package:store_app/imports.dart';

class Body extends StatelessWidget {
  var cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    cartController.onInit();
    return Obx(
      () => Container(
        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ...List.generate(
                  cartController.cart.value.length,
                  (index) => CartItemCard(
                        item: cartController.cart.value[index],
                      )),
              SelectAllCheckBox(),
              SizedBox(height: 30),
              SizedBox(
                width: SizeConfig.screenWidth * 0.6,
                child: DefaultButton(
                  text: "Go to check out",
                  press: () {
                    if (Get.find<CartController>()
                        .cart
                        .value
                        .any((element) => element.isChosen == true)) {
                      try {
                        Get.find<CheckOutController>().onInit();
                      } catch (e) {
                        print("Go to CheckOut page first time");
                      }

                      Get.to(() => CheckOutScreen());
                    } else {
                      Get.snackbar(
                          "Notification", "Please select at least 1 item");
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SelectAllCheckBox extends StatefulWidget {
  const SelectAllCheckBox({
    Key key,
  }) : super(key: key);

  @override
  _SelectAllCheckBoxState createState() => _SelectAllCheckBoxState();
}

class _SelectAllCheckBoxState extends State<SelectAllCheckBox> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 10,
        ),
        Checkbox(
            value: isSelected,
            onChanged: (value) {
              isSelected = value;
              Get.find<CartController>().toggleAllCheckBox(value);
            }),
        Text(
          "Select all",
          style: TextStyle(
              color: Colors.black, fontSize: getProportionateScreenHeight(16)),
        ),
      ],
    );
  }
}
