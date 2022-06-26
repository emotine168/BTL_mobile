import 'package:flutter/material.dart';
import 'package:store_app/components/custom_drawer.dart';
import 'package:store_app/components/heading_bar.dart';
import 'components/body.dart';

class AdminUsersScreen extends StatelessWidget {
  static String routeName = "admin-users";
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
