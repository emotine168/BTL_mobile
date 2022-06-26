import 'package:store_app/imports.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: SizeConfig.screenHeight * 0.35,
              width: SizeConfig.screenWidth * 0.6,
              child: SvgPicture.asset("assets/images/form.svg"),
            ),
            SignUpForm(),
          ],
        ),
      ),
    );
  }
}
