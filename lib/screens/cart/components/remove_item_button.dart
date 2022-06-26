import 'package:store_app/imports.dart';

class RemoveItemButton extends StatelessWidget {
  const RemoveItemButton({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final CartItemCard widget;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Do you want to remove this product from your cart ?"),
            actions: [
              FlatButton(
                  onPressed: () {
                    Get.find<CartController>().removeItem(widget.item);
                    Navigator.pop(context);
                  },
                  child: Text("Yes")),
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("No"))
            ],
          ),
        );
      },
      child: SizedBox(
        width: getProportionateScreenHeight(40),
        child: SvgPicture.asset(
          "assets/icons/Trash.svg",
        ),
      ),
    );
  }
}
