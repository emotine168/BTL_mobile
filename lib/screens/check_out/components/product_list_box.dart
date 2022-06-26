import 'package:store_app/imports.dart';

class ProductList extends StatelessWidget {
  const ProductList({
    Key key,
    @required CheckOutController checkOutController,
  })  : _checkOutController = checkOutController,
        super(key: key);

  final CheckOutController _checkOutController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(
            _checkOutController.items.value.length,
            (index) =>
                CheckOutItem(item: _checkOutController.items.value[index])),
      ],
    );
  }
}

class CheckOutItem extends StatelessWidget {
  const CheckOutItem({
    Key key,
    @required this.item,
  }) : super(key: key);

  final CartItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(border: Border.all(color: Colors.grey[50])),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: SizeConfig.screenWidth * 0.2,
            child: Image.asset(item.product.images[0]),
          ),
          Container(
            width: SizeConfig.screenWidth * 0.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.product.title,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(item.product.price,
                        style: TextStyle(color: Colors.red)),
                    Spacer(),
                    Text(
                      "x${item.numOfItem.toString()}",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
