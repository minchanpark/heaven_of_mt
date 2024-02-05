import 'package:flutter/material.dart';

import 'home_app.dart';
import 'home_web.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    print(width);
    if (width > 30) {
      return HomeWeb();
    } else {
      return const HomeApp();
    }
  }
}
