import 'package:store_app/imports.dart';

class PageDots extends StatelessWidget {
  const PageDots({
    Key key,
    @required this.splashData,
    @required this.currentPage,
  }) : super(key: key);

  final List<Map<String, String>> splashData;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        splashData.length,
        (index) => AnimatedContainer(
          duration: Duration(milliseconds: 200),
          margin: EdgeInsets.all(getProportionateScreenWidth(4)),
          height: 10,
          width: index == currentPage ? 30 : 15,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: index == currentPage ? Colors.lightGreen : kSecondaryColor,
          ),
        ),
      ),
    );
  }
}
