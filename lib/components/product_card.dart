import 'package:store_app/imports.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductDetailsScreen.routeName,
          arguments: ProductDetailsArguments(product: product),
        );
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Image.asset(
              product.images[0],
              height: 140,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          SizedBox(height: 5),
          Text(product.title, textAlign: TextAlign.center),
          Text(product.price, style: TextStyle(color: Colors.red)),
          SizedBox(height: 5),
        ],
      ),
    );
  }
}
