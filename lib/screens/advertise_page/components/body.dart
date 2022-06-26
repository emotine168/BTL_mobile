import 'package:store_app/imports.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Product> list = [];
  bool isLoading = true;
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void fetchData() async {
    List<Product> productList = await ApiServices.fetchProducts("phones");
    setState(() {
      list = productList;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset("assets/images/hot_deal_1_background.png"),
          SizedBox(
            height: 10,
          ),
          Image.asset("assets/images/hot_deal_1_banner.png"),
          !isLoading
              ? Expanded(
                  child: GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    childAspectRatio: MediaQuery.of(context).size.height / 1300,
                    padding: const EdgeInsets.all(10.0),
                    mainAxisSpacing: 20,
                    children: [
                      ...List.generate(
                        list.length,
                        (index) => ProductCard(
                          product: list[index],
                        ),
                      ),
                    ],
                  ),
                )
              : CircularProgressIndicator(),
        ],
      ),
    );
  }
}
