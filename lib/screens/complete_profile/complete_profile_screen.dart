import 'package:flutter/material.dart';
import './components/body.dart';

class CompleteProfileScreen extends StatelessWidget {
  static String routeName = "/complete-profile";
  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Body(
        arg: arg,
      ),
    );
  }
}
