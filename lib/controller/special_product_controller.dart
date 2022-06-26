import 'package:store_app/imports.dart';

class SpecialProductsController extends GetxController {
  var menuType = 'Phone'.obs;
  var isLoading = true.obs;
  var productList = List<Product>().obs;

  Map<String, String> typeToType = {
    'Phone': 'phones',
    'Accessories': 'acs',
    'Tablet': 'tablets',
    'Laptop': 'laptops',
    'Watch': 'watches'
  };
  @override
  void onInit() async {
    // TODO: implement onInit
    print('init');
    fetchProducts(typeToType[menuType.value]);
    super.onInit();
  }

  void fetchProducts(String type) async {
    try {
      isLoading(true);
      var products = await ApiServices.fetchProducts(type);
      if (products != null) {
        productList.value = products.sublist(0, 4);
      }
    } finally {
      // TODO
      isLoading(false);
    }
  }

  void changeType(String type) {
    menuType.value = type;
    fetchProducts(typeToType[type]);
  }
}
