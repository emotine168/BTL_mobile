import 'package:store_app/imports.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeading(),
          Get.find<UserController>().user.value.email == 'admin@example.com'
              ? OptionListForAdmin()
              : OptionListForUser(),
        ],
      ),
    );
  }
}

class OptionListForAdmin extends StatelessWidget {
  const OptionListForAdmin({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomListTile(
          icon: "assets/icons/orders.svg",
          title: "Orders",
          press: () {
            Get.to(() => AdminOrdersScreen());
          },
        ),
        CustomListTile(
          icon: "assets/icons/vsmartphone.svg",
          title: "Product",
          press: () {
            Get.to(() => AdminProductsScreen());
          },
        ),
        CustomListTile(
          icon: "assets/icons/discount-tag.svg",
          title: "Discounts",
          press: () {
            Get.to(() => AdminUsersScreen());
          },
        ),
        CustomListTile(
          icon: "assets/icons/vperson.svg",
          title: "Users",
          press: () {
            Get.to(() => AdminUsersScreen());
          },
        ),
        CustomListTile(
          icon: "assets/icons/log-out.svg",
          title: "Log out",
          press: () {
            Get.find<UserController>().clear();
            Get.find<AuthController>().clear();
            Get.to(() => SplashScreen());
          },
        ),
      ],
    );
  }
}

class OptionListForUser extends StatelessWidget {
  const OptionListForUser({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomListTile(
          icon: "assets/icons/vhome.svg",
          title: "Home",
          press: () {
            Get.to(() => HomeScreen());
          },
        ),
        CustomListTile(
          icon: "assets/icons/vperson.svg",
          title: "Profile",
          press: () {
            Get.to(() => ProfileScreen());
          },
        ),
        CustomListTile(
          icon: "assets/icons/vsmartphone.svg",
          title: "Product",
          press: () {
            Get.to(() => ProductListPageScreen());
          },
        ),
        CustomListTile(
          icon: "assets/icons/log-out.svg",
          title: "Log out",
          press: () {
            Get.find<UserController>().clear();
            Get.find<AuthController>().clear();
            Get.to(() => SplashScreen());
          },
        ),
      ],
    );
  }
}

class DrawerHeading extends StatelessWidget {
  const DrawerHeading({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: BoxDecoration(
        color: Colors.lightGreen,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              "assets/images/avt.jpg",
              width: SizeConfig.screenWidth * 0.28,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          SizedBox(
            width: SizeConfig.screenWidth * 0.3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Get.find<UserController>().user.value.userName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Score: 123",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key key,
    this.icon,
    this.title,
    this.press,
  }) : super(key: key);

  final GestureTapCallback press;
  final String icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(),
        child: Row(
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  icon,
                  height: 20,
                  color: kSecondaryColor,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
