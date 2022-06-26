import 'package:store_app/imports.dart';

import 'components/body.dart';

class DiscountScreen extends StatelessWidget {
  static String routeName = "/discount";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Discount selection",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}
