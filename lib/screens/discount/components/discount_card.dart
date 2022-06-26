import 'package:store_app/imports.dart';

class DiscountCard extends StatelessWidget {
  const DiscountCard({
    Key key,
    @required this.discount,
  }) : super(key: key);

  final Discount discount;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.find<CheckOutController>().setDiscount(discount);
        Get.back();
      },
      child: ItemCardContainer(
        child: Container(
          margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    discount.name,
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  SizedBox(height: 5),
                  Text("Value: ${discount.value}"),
                  SizedBox(height: 5),
                  Text(
                      "Expiry Date: ${formatDateTimetoTime(discount.endDate)}"),
                ],
              ),
              SvgPicture.asset(
                "assets/icons/Bill Icon.svg",
                color: Colors.lightGreen,
                height: 35,
              )
            ],
          ),
        ),
      ),
    );
  }
}
