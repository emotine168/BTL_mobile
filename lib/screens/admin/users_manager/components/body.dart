import 'package:store_app/imports.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var _controller = Get.put(UsersAdminPageController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => !_controller.isLoading.value
        ? SingleChildScrollView(
            child: Column(
              children: [
                ...List.generate(_controller.users.length,
                    (index) => UserCard(user: _controller.users.value[index]))
              ],
            ),
          )
        : CircularProgressIndicator());
  }
}
