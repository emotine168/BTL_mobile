import 'package:store_app/imports.dart';
import 'components/body.dart';

class EditProductScreen extends StatelessWidget {
  static String routeName = "/edit-product";
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(),
      body: Body(product: arguments),
    );
  }
}
