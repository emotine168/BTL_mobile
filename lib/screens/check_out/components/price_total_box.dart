import 'package:store_app/imports.dart';

class ProductPriceTotal extends StatelessWidget {
  const ProductPriceTotal({
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
        color: Colors.red[50],
        border: Border.all(color: Colors.red[100]),
      ),
      child: Row(
        children: [
          Text(
            "Total:",
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          Spacer(),
          Text(
            numberToPrice(_checkOutController.total.value),
            style: TextStyle(fontSize: 20, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
