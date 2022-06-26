import 'package:store_app/imports.dart';
import './components/body.dart';

class OtpScreen extends StatelessWidget {
  static String routeName = "/otp";

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context).settings.arguments;
    print(arg);
    return Scaffold(
      appBar: AppBar(
        title: Text("OTP Verification"),
        centerTitle: true,
      ),
      body: Body(
        arg: arg,
      ),
    );
  }
}
