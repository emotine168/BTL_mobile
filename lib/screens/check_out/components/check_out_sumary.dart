import 'package:store_app/imports.dart';

class CheckOutSumary extends StatelessWidget {
  const CheckOutSumary({
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
        color: Colors.deepOrange[50],
        border: Border.all(color: Colors.deepOrange[100]),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Payment method",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              Spacer(),
              Text(
                "Select method",
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
              SizedBox(width: 10),
              Container(
                margin: EdgeInsets.only(right: 10),
                child: SvgPicture.asset("assets/icons/arrow_right.svg"),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Text(
                "Total: ",
                style: TextStyle(fontSize: 16),
              ),
              Spacer(),
              Text(
                numberToPrice(_checkOutController.totalAfterDiscount.value),
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Text(
                "Shipping: ",
                style: TextStyle(fontSize: 16),
              ),
              Spacer(),
              Text(
                numberToPrice(
                    _checkOutController.shippingFeeAfterDiscount.value),
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Text(
                "Total: ",
                style: TextStyle(fontSize: 20, color: Colors.red),
              ),
              Spacer(),
              Text(
                numberToPrice(
                    _checkOutController.shippingFeeAfterDiscount.value +
                        _checkOutController.totalAfterDiscount.value),
                style: TextStyle(fontSize: 20, color: Colors.red),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
