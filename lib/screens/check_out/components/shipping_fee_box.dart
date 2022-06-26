import 'package:store_app/imports.dart';

class ShippingFee extends StatelessWidget {
  const ShippingFee({
    Key key,
    @required CheckOutController checkOutController,
  })  : _checkOutController = checkOutController,
        super(key: key);

  final CheckOutController _checkOutController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.lightGreen[50],
        border: Border.all(color: Colors.lightGreen[100]),
      ),
      child: Row(
        children: [
          Text(
            "Shipping fee",
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          Spacer(),
          _checkOutController.discountSelected != null
              ? Text(numberToPrice(_checkOutController.shippingFee.value))
              : Text(""),
        ],
      ),
    );
  }
}
