import 'package:store_app/imports.dart';

class ButtonWithShadow extends StatelessWidget {
  const ButtonWithShadow({
    Key key,
    this.text,
    this.press,
  }) : super(key: key);
  final Widget text;
  final Function press;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
      padding: EdgeInsets.fromLTRB(5, 15, 5, 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.blueGrey[100],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: FlatButton(
        child: text,
        onPressed: press,
      ),
    );
  }
}
