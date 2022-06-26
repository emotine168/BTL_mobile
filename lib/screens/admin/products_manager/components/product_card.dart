import 'package:store_app/imports.dart';

class AdminProductCard extends StatelessWidget {
  const AdminProductCard({
    Key key,
    @required Product product,
  })  : product = product,
        super(key: key);

  final Product product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ItemCardContainer(
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              width: 120,
              child: Image.asset(product.images[0]),
            ),
            Container(
              width: SizeConfig.screenWidth * 0.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    maxLines: 2,
                  ),
                  Text(
                    product.price,
                    style: TextStyle(color: Colors.red),
                  ),
                  Text('ID: ' + product.id),
                ],
              ),
            ),
            Column(
              children: [
                // edit button
                GestureDetector(
                  onTap: () {
                    Get.to(() => EditProductScreen(), arguments: product);
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 10),
                    width: 50,
                    child: Icon(Icons.build_outlined),
                  ),
                ),
                SizedBox(height: 30),
                //delete button
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(
                            "Are your sure you want to delete this product ?"),
                        actions: [
                          FlatButton(
                              onPressed: () async {
                                await ApiServices.deleteProduct(product.id);
                                Get.back();
                              },
                              child: Text("Yes")),
                          FlatButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: Text("No")),
                        ],
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 10),
                    width: 50,
                    child: Icon(Icons.delete_outline, color: Colors.red),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
