import 'package:store_app/imports.dart';

class SettingSectionWithSwitch extends StatelessWidget {
  const SettingSectionWithSwitch({
    Key key,
    @required this.text,
    @required this.press,
  }) : super(key: key);

  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SwitchListTile(
          activeColor: Colors.lightGreen,
          contentPadding: EdgeInsets.all(0),
          title: Text(
            text,
            style: TextStyle(fontSize: 18),
          ),
          value: true,
          onChanged: press,
        ),
        Divider(color: Colors.black),
      ],
    );
  }
}
