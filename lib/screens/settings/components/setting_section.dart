import 'package:store_app/imports.dart';

class SettingSection extends StatelessWidget {
  const SettingSection({
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
        GestureDetector(
          onTap: press,
          child: Container(
            margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
            child: Row(
              children: [
                Text(
                  text,
                  style: TextStyle(fontSize: 18),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: SvgPicture.asset("assets/icons/arrow_right.svg"),
                ),
              ],
            ),
          ),
        ),
        Divider(color: Colors.black),
      ],
    );
  }
}
