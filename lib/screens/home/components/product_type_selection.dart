import 'package:store_app/imports.dart';

class ProductTypeSelections extends StatelessWidget {
  const ProductTypeSelections({
    Key key,
    @required this.specialProductsController,
  }) : super(key: key);

  final SpecialProductsController specialProductsController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...List.generate(
              productTypeList.length,
              (index) => ProductTypeButton(
                    currentType: specialProductsController.menuType.value,
                    text: productTypeList[index],
                    press: () {
                      specialProductsController
                          .changeType(productTypeList[index]);
                    },
                  )),
        ],
      ),
    );
  }
}

class ProductTypeButton extends StatelessWidget {
  const ProductTypeButton({
    Key key,
    @required this.currentType,
    @required this.text,
    @required this.press,
  }) : super(key: key);

  final String currentType;
  final String text;
  final GestureTapCallback press;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: EdgeInsets.only(right: 15, left: 15),
        margin: EdgeInsets.only(right: 10),
        height: 30,
        decoration: BoxDecoration(
          color: currentType == text
              ? kSecondaryColor.withOpacity(0.4)
              : kSecondaryColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontSize: getProportionateScreenHeight(16),
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
