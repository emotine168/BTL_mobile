import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/components/custom_drawer.dart';
import 'package:store_app/controller/product_page_controller.dart';
import 'package:store_app/components/heading_bar.dart';
import 'components/body.dart';

class ProductListPageScreen extends StatelessWidget {
  static String routeName = "/product-list-page";
  var _controller = Get.put(ProductListPageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Builder(
          builder: (context) => HeadingBar(
            openDrawer: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      body: Body(),
      drawer: CustomDrawer(),
    );
  }
}
