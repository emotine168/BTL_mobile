import 'package:store_app/imports.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key key,
    this.text,
    this.press,
  }) : super(key: key);
  final String text;
  final Function press;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(56),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.lightGreen,
        borderRadius: BorderRadius.circular(20),
      ),
      child: FlatButton(
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
            fontSize: getProportionateScreenHeight(22),
            color: Colors.white,
          ),
        ),
        onPressed: press,
      ),
    );
  }
}
