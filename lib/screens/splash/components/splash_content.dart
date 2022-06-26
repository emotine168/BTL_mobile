import 'package:store_app/imports.dart';

class SpashContent extends StatelessWidget {
  const SpashContent({
    Key key,
    @required this.image,
    @required this.text,
  }) : super(key: key);

  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          image,
          height: SizeConfig.screenHeight * 0.3,
        ),
        SizedBox(
          height: SizeConfig.screenHeight * 0.05,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: getProportionateScreenHeight(15),
            color: kSecondaryColor,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
