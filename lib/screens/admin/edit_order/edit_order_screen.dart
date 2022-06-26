import 'package:store_app/imports.dart';
import 'components/body.dart';

class EditOrderScreen extends StatelessWidget {
  static String routeName = "/edit-order";
  @override
  Widget build(BuildContext context) {
    var order = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(),
      body: Body(order: order),
    );
  }
}
