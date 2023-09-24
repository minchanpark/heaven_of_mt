import 'package:flutter/material.dart';

import 'home_app.dart';
import 'home_web.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  List<String> gameName = ["액션초성게임", "인물퀴즈", "네 글자 퀴즈", "단어텔레파시", "랜덤게임"];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    if (width > 500) {
      return HomeWeb(width: width, height: height, gameName: gameName);
    } else {
      return HomeApp(width: width, height: height, gameName: gameName);
    }
  }
}
