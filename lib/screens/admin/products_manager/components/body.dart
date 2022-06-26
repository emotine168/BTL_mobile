import 'package:store_app/imports.dart';

class Body extends StatelessWidget {
  var _controller = Get.put(ProductListPageController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          CustomProductTypeSelections(
            type: _controller.type.value,
          ),
          !_controller.isLoading.value
              ? Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ...List.generate(
                          _controller.productList.value.length,
                          (index) => AdminProductCard(
                            product: _controller.productList.value[index],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : CircularProgressIndicator(),
        ],
      ),
    );
  }
}
