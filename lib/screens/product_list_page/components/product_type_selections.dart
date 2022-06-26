import 'package:store_app/imports.dart';

class CustomProductTypeSelections extends StatelessWidget {
  const CustomProductTypeSelections({
    Key key,
    this.type,
  }) : super(key: key);

  final String type;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...List.generate(
              productTypeList.length,
              (index) => CustomProductTypeButton(
                    currentType: type,
                    text: productTypeList[index],
                  )),
        ],
      ),
    );
  }
}
