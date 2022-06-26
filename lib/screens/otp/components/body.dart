import 'package:store_app/imports.dart';

class Body extends StatelessWidget {
  final arg;

  const Body({
    Key key,
    @required this.arg,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              Text(
                "OTP Verification",
                style: headingStyle,
              ),
              SizedBox(height: 10),
              Text("We send your code to +84 866 603 ***"),
              buildTimer(),
              SizedBox(height: SizeConfig.screenHeight * 0.15),
              OtpForm(),
              SizedBox(height: SizeConfig.screenHeight * 0.15),
              DefaultButton(
                text: "Continue",
                press: () {
                  Get.to(() => CompleteProfileScreen(), arguments: arg);
                },
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.15),
              GestureDetector(
                onTap: () {
                  //Re-send OTP code
                },
                child: Text(
                  "Re-send OTP Code",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("This code will expired in "),
        TweenAnimationBuilder(
          tween: Tween(begin: 30.0, end: 0),
          duration: Duration(seconds: 30),
          builder: (context, value, child) => Text(
            "00:${value.toInt()}",
            style: TextStyle(color: kPrimaryColor),
          ),
          onEnd: () {},
        ),
      ],
    );
  }
}
