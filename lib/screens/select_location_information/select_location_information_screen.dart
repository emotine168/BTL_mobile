import 'package:store_app/imports.dart';
import 'components/body.dart';

class SelectLocationInformationScreen extends StatelessWidget {
  static String routeName = "/select-location-information";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add new location",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        leading: Container(),
      ),
      body: Body(),
    );
  }
}
