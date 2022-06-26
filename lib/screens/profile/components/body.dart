import 'package:store_app/imports.dart';

class Body extends StatelessWidget {
  @override
  const Body({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              //background
              Column(
                children: [
                  Container(
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.screenHeight * 0.2,
                    color: Colors.lightGreen,
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.02,
                  ),
                ],
              ),
              ProfileHeading(),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: ProfileForm(),
          ),
        ],
      ),
    );
  }
}
