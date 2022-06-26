import 'package:store_app/imports.dart';
import 'components/body.dart';

class AdvertiseScreen extends StatelessWidget {
  static String routeName = "/advertise";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Body(),
    );
  }
}
