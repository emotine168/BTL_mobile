import 'package:store_app/imports.dart';

class DiscountSelection extends StatelessWidget {
  final List<Discount> discountList;
  final Discount discountSelected;

  const DiscountSelection({
    Key key,
    this.discountList,
    this.discountSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => DiscountScreen());
      },
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.amber[50],
          border: Border.all(color: Colors.amber[200]),
        ),
        child: Row(
          children: [
            Text(
              "Voucher",
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            Spacer(),
            discountSelected.name != null
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        discountSelected.name,
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Value: ${discountSelected.value}"),
                    ],
                  )
                : Text(
                    "Select voucher",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
            SizedBox(width: 10),
            Container(
              margin: EdgeInsets.only(right: 10),
              child: SvgPicture.asset("assets/icons/arrow_right.svg"),
            ),
          ],
        ),
      ),
    );
  }
}
