import 'package:store_app/imports.dart';

class SpecialProducts extends StatelessWidget {
  final specialProductsController = Get.put(SpecialProductsController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          ProductTypeSelections(
              specialProductsController: specialProductsController),
          !specialProductsController.isLoading.value
              ? Container(
                  padding: EdgeInsets.only(top: 10),
                  width: SizeConfig.screenWidth * 0.9,
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: new NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    childAspectRatio: MediaQuery.of(context).size.height / 1300,
                    padding: const EdgeInsets.all(10.0),
                    mainAxisSpacing: 20,
                    children: [
                      ...List.generate(
                        4,
                        (index) => ProductCard(
                          product: specialProductsController.productList[index],
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
