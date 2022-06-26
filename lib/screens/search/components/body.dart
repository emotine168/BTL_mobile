import 'package:store_app/imports.dart';

class Body extends StatelessWidget {
  var searchController = Get.put(SearchController());
  Widget build(BuildContext context) {
    return Obx(
      () => GridView.count(
        shrinkWrap: true,
        crossAxisCount: 2,
        childAspectRatio: MediaQuery.of(context).size.height / 1300,
        padding: const EdgeInsets.all(10.0),
        mainAxisSpacing: 20,
        children: [
          ...List.generate(
            searchController.productList.value.length,
            (index) => ProductCard(
              product: searchController.productList.value[index],
            ),
          ),
        ],
      ),
    );
  }
}
