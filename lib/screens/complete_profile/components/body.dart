import 'package:store_app/imports.dart';

class Body extends StatelessWidget {
  final arg;

  const Body({
    Key key,
    @required this.arg,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              Text(
                "COMPLETE YOUR PROFILE",
                style: headingStyle,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              ProfileForm(arg: arg),
            ],
          ),
        ),
      ),
    );
  }
}
