import 'package:store_app/imports.dart';
import './components/body.dart';

class SelectLocationScreen extends StatelessWidget {
  static String routeName = "/select-location";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Select location",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}
