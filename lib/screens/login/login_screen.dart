import 'package:store_app/imports.dart';
import 'components/body.dart';

class LoginScreen extends GetWidget<AuthController> {
  static String routeName = "/login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Body(),
    );
  }
}
