import 'package:store_app/imports.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Text(
              "LOGIN",
              style: headingStyle,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.35,
              width: SizeConfig.screenWidth * 0.6,
              child: SvgPicture.asset("assets/images/form.svg"),
            ),
            LoginForm(),
          ],
        ),
      ),
    );
  }
}
