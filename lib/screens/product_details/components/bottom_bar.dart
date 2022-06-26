import 'package:store_app/imports.dart';

class ProductDetailsBottomBar extends PreferredSize {
  ProductDetailsBottomBar({
    this.product,
    Key key,
  });
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
  final Product product;
  final cartController = Get.put(CartController());
  final userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    final isChosen =
        cartController.cart.any((element) => element.product.id == product.id);
    return BottomBarr(
        isChosen: isChosen, cartController: cartController, product: product);
  }
}

class BottomBarr extends StatefulWidget {
  const BottomBarr({
    Key key,
    @required this.isChosen,
    @required this.cartController,
    @required this.product,
  }) : super(key: key);

  final bool isChosen;
  final CartController cartController;
  final Product product;

  @override
  _BottomBarrState createState() => _BottomBarrState();
}

class _BottomBarrState extends State<BottomBarr> {
  bool isChosen = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.fromLTRB(30, 20, 20, 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: getProportionateScreenWidth(35),
              height: getProportionateScreenWidth(35),
              child: SvgPicture.asset(
                "assets/icons/vmessenger.svg",
                color: kSecondaryColor,
              ),
            ),
            GestureDetector(
              onTap: () {
                if (!widget.isChosen) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text(
                          "Do you want to add this product to your cart ?"),
                      actions: [
                        FlatButton(
                            onPressed: () {
                              widget.cartController.addItem(CartItem(
                                  product: widget.product,
                                  numOfItem: 1,
                                  isChosen: false));
                              setState(() {
                                isChosen = true;
                              });
                              Navigator.pop(context);
                            },
                            child: Text("Yes")),
                        FlatButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("No")),
                      ],
                    ),
                  );
                } else {
                  //do sth
                }
              },
              child: SizedBox(
                width: 35,
                height: 35,
                child: SvgPicture.asset(
                  "assets/icons/vcart.svg",
                  color: (widget.isChosen || isChosen)
                      ? Colors.lightGreen
                      : kSecondaryColor,
                ),
              ),
            ),
            SizedBox(
              width: SizeConfig.screenWidth * 0.4,
              child: DefaultButton(text: "BUY NOW"),
            ),
          ],
        ),
      ),
    );
  }
}
