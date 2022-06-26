import 'package:store_app/imports.dart';

class Body extends StatelessWidget {
  final Order order;

  const Body({Key key, this.order}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //products
          Text("Product:", style: normalText),
          ...List.generate(
            order.items.length,
            (index) => Row(
              children: [
                ItemCardContainer(
                    child: Container(
                  margin: EdgeInsets.all(5),
                  child: Text(
                    order.items[index].productId,
                    style: TextStyle(fontSize: 18),
                  ),
                )),
                Text(' x ' + order.items[index].quantity.toString(),
                    style: normalText),
              ],
            ),
          ),
          // details
          Text("Sub Total: ${order.subTotal}", style: normalText),
          SizedBox(height: 10),
          Text("Discount: ${order.discount}", style: normalText),
          SizedBox(height: 10),
          Text("Address: ${order.shippingAddress.address}", style: normalText),
          SizedBox(height: 10),
          Text("Phone number: ${order.shippingAddress.phoneNumber}",
              style: normalText),
          SizedBox(height: 10),
          Text("Shipping: ${order.shipping}", style: normalText),
          SizedBox(height: 10),
          Text("Order Time: 2 days left", style: normalText),
          SizedBox(height: 10),
          Text("Total: ${order.total}", style: normalText),
          SizedBox(height: 10),
          Center(
            child: SizedBox(
              width: SizeConfig.screenWidth * 0.6,
              child: DefaultButton(
                text: "SAVE",
                press: () {
                  Get.back();
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
