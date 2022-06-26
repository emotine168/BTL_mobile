import 'package:store_app/imports.dart';
import './components/body.dart';

class OrderSuccessScreen extends StatelessWidget {
  static String routeName = "/order-success";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
