import 'package:store_app/imports.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight * 0.3),
          SvgPicture.asset(
            "assets/icons/Success.svg",
            color: Colors.lightGreen,
            width: SizeConfig.screenWidth * 0.5,
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          Text(
            "LOGIN SUCCESS",
            style: TextStyle(
              fontSize: 30,
              color: Colors.lightGreen,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.15),
          SizedBox(
            width: SizeConfig.screenWidth * 0.6,
            child: DefaultButton(
              text: "back to home",
              press: () {
                // if admin
                if (Get.find<UserController>().user.value.email ==
                    'admin@example.com')
                  Get.to(() => AdminOrdersScreen());
                // if user
                else
                  Get.to(() => HomeScreen());
              },
            ),
          )
        ],
      ),
    );
  }
}
