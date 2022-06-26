import 'package:store_app/imports.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({Key key, this.product}) : super(key: key);

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ImageSlide(images: product.images),
          Container(
            margin: EdgeInsets.all(20),
            child: Column(
              children: [
                // title
                Text(
                  product.title,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
                // price
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    product.price,
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  ),
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        // rating
                        ...List.generate(
                          5,
                          (index) => Container(
                            margin: EdgeInsets.all(3),
                            child: SvgPicture.asset(
                              "assets/icons/Star Icon.svg",
                              color: Colors.blueGrey[200],
                              height: getProportionateScreenHeight(20),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 180,
                        ),
                        // love
                        SvgPicture.asset(
                          "assets/icons/heart.svg",
                          color:
                              product.love ? Colors.red : Colors.blueGrey[200],
                          height: getProportionateScreenHeight(40),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  product.description,
                  style: TextStyle(
                    color: kSecondaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
