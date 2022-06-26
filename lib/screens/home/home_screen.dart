import 'package:flutter/material.dart';
import 'package:store_app/components/bottom_bar.dart';
import 'package:store_app/components/custom_drawer.dart';
import 'package:store_app/components/heading_bar.dart';
import 'package:store_app/screens/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
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
      bottomNavigationBar: BottomBar(
        selectedRoute: routeName,
      ),
      drawer: CustomDrawer(),
    );
  }
}
