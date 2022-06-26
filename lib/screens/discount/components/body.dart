import 'package:store_app/imports.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Discount> discounts = Get.find<CheckOutController>().discountList.value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ...List.generate(
            discounts.length,
            (index) => DiscountCard(discount: discounts[index]),
          )
        ],
      ),
    );
  }
}
