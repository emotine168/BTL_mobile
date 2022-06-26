import 'package:store_app/imports.dart';

class QuantityCounter extends StatelessWidget {
  const QuantityCounter({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final CartItemCard widget;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: SizedBox(
        width: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                if (widget.item.numOfItem > 1)
                  Get.find<CartController>().changeProductQuantity(
                      widget.item.product.id, widget.item.numOfItem - 1);
              },
              child: SizedBox(
                width: 15,
                height: 15,
                child: SvgPicture.asset("assets/icons/remove.svg"),
              ),
            ),
            Text(
              widget.item.numOfItem.toString(),
              style: TextStyle(fontSize: 16),
            ),
            GestureDetector(
              onTap: () {
                if (widget.item.numOfItem < 20)
                  Get.find<CartController>().changeProductQuantity(
                      widget.item.product.id, widget.item.numOfItem + 1);
              },
              child: SizedBox(
                width: 15,
                height: 15,
                child: SvgPicture.asset("assets/icons/plus.svg"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
