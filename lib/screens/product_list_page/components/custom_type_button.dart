import 'package:store_app/imports.dart';

class CustomProductTypeButton extends StatelessWidget {
  const CustomProductTypeButton({
    Key key,
    @required this.currentType,
    @required this.text,
  }) : super(key: key);

  final String currentType;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.find<ProductListPageController>().setType(text);
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(
          getProportionateScreenHeight(20),
          getProportionateScreenHeight(10),
          getProportionateScreenHeight(20),
          getProportionateScreenHeight(10),
        ),
        margin: EdgeInsets.all(
          getProportionateScreenWidth(10),
        ),
        decoration: BoxDecoration(
          color: currentType == text
              ? kPrimaryColor.withOpacity(0.85)
              : kSecondaryColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontSize: getProportionateScreenHeight(24),
              fontWeight: FontWeight.w300,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
