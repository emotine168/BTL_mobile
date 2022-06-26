import 'package:store_app/imports.dart';

class CartItem {
  final Product product;
  final int numOfItem;
  final isChosen;

  CartItem({
    @required this.isChosen,
    @required this.product,
    @required this.numOfItem,
  });
}
