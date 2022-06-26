import 'package:store_app/imports.dart';
import './components/body.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/sign-up";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}
