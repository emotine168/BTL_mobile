import 'package:store_app/imports.dart';

class CartItemCard extends StatefulWidget {
  final CartItem item;

  const CartItemCard({
    Key key,
    this.item,
  }) : super(key: key);

  @override
  _CartItemCardState createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  @override
  Widget build(BuildContext context) {
    return ItemCardContainer(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Checkbox(
            value: widget.item.isChosen,
            onChanged: (value) {
              Get.find<CartController>()
                  .toggleChosenCheckBox(widget.item.product.id, value);
            },
          ),
          tapToNavigateToProductDetails(
            context: context,
            item: widget.item.product,
            child: Column(
              children: [
                SizedBox(
                  width: 70,
                  child: Image.asset(widget.item.product.images[0]),
                ),
                SizedBox(width: 5),
              ],
            ),
          ),
          SizedBox(
            width: 160,
            child: Column(
              children: [
                tapToNavigateToProductDetails(
                  context: context,
                  item: widget.item.product,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          widget.item.product.title,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          widget.item.product.price,
                          style: TextStyle(fontSize: 14, color: Colors.red),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                QuantityCounter(widget: widget),
              ],
            ),
          ),
          SizedBox(width: 15),
          RemoveItemButton(widget: widget)
        ],
      ),
    );
  }
}

GestureDetector tapToNavigateToProductDetails({Widget child, context, item}) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(
        context,
        ProductDetailsScreen.routeName,
        arguments: ProductDetailsArguments(product: item),
      );
    },
    child: child,
  );
}
