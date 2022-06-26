import 'package:store_app/imports.dart';

class Body extends StatelessWidget {
  var _controller = Get.put(OrdersAdminController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => !_controller.isLoading.value
        ? SingleChildScrollView(
            child: Column(
              children: [
                ...List.generate(
                    _controller.orders.value.length,
                    (index) => OrderCard(
                          order: _controller.orders.value[index],
                        ))
              ],
            ),
          )
        : CircularProgressIndicator());
  }
}
