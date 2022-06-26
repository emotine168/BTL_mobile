import 'package:store_app/imports.dart';

import 'components/body.dart';

class CheckOutScreen extends StatelessWidget {
  static String routeName = "/check-out";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Check out",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}
