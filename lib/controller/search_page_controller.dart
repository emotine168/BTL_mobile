import 'package:store_app/imports.dart';

class SearchController extends GetxController {
  var text = ''.obs;
  var productList = List<Product>().obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      var products = await ApiServices.fetchProductsBySearch(text.value);
      if (products != null) {
        print(products);
        productList.value = products;
      }
    } finally {}
  }

  void search(String textt) {
    text.value = textt;
    fetchProducts();
  }
}
