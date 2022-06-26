import 'package:store_app/imports.dart';
import 'components/body.dart';

class ProductDetailsScreen extends StatelessWidget {
  static String routeName = "/product_details";

  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments arguments =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(),
      body: Body(
        product: arguments.product,
      ),
      bottomNavigationBar: ProductDetailsBottomBar(
        product: arguments.product,
      ),
    );
  }
}
