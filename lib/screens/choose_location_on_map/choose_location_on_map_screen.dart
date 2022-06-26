import 'package:store_app/imports.dart';
import './components/body.dart';

class ChooseLocationOnMapScreen extends StatelessWidget {
  static String routeName = "/choose-location-on-map";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Choose new location",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Body(),
    );
  }
}
