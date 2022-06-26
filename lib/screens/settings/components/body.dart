import 'package:store_app/imports.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SettingsPart(
            title: "Account Settings",
            child: Column(
              children: [
                SettingSection(
                  text: "Your profile",
                  press: () {},
                ),
                SettingSection(
                  text: "Address",
                  press: () {},
                ),
                SettingSection(
                  text: "Digital Wallet",
                  press: () {},
                ),
              ],
            ),
          ),
          SettingsPart(
            title: "Application Settings",
            child: Column(
              children: [
                SettingSectionWithSwitch(
                    text: "Chat settings", press: (value) {}),
                SettingSectionWithSwitch(
                    text: "Notification settings", press: (value) {}),
                SettingSectionWithSwitch(text: "Language", press: (value) {}),
                SettingSectionWithSwitch(text: "Dark mode", press: (value) {}),
              ],
            ),
          ),
          SettingsPart(
            title: "Support",
            child: Column(
              children: [
                SettingSection(
                  text: "Support center",
                  press: () {},
                ),
                SettingSection(
                  text: "Tips & Tricks",
                  press: () {},
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            width: SizeConfig.screenWidth * 0.8,
            child: DefaultButton(
              text: "LOG OUT",
              press: () {
                Get.find<UserController>().clear();
                Get.find<AuthController>().clear();
                Get.to(() => SplashScreen());
              },
            ),
          ),
        ],
      ),
    );
  }
}
