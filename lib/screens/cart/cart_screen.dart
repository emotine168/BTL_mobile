import 'package:store_app/imports.dart';
import './components/body.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Your Cart",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Body(),
      bottomNavigationBar: BottomBar(selectedRoute: routeName),
    );
  }
}
