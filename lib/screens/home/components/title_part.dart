import 'package:store_app/imports.dart';

class TitlePart extends StatelessWidget {
  const TitlePart({
    Key key,
    @required this.text,
    @required this.press,
  }) : super(key: key);
  final String text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: getProportionateScreenWidth(20),
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: press,
              child: Text(
                "See more",
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(12),
                    color: Colors.lightBlue),
              ),
            ),
          ],
        ),
        Divider(
          color: Colors.black,
          height: 20,
        ),
      ],
    );
  }
}
