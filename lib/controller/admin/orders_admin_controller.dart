import 'package:store_app/imports.dart';

class OrdersAdminController extends GetxController {
  var isLoading = true.obs;
  var orders = List<Order>().obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    orders.value = await ApiServices.fetchOrders();
    isLoading.value = false;
  }
}
