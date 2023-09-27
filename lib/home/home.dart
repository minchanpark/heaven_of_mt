import 'package:flutter/material.dart';

import '../choi/choi_game_page.dart';
import 'home_app.dart';
import 'home_web.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  List<String> gameName = ["액션초성게임", "인물퀴즈", "네글자퀴즈", "단어텔레파시", "랜덤게임"];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    if (width > 600) {
      return HomeWeb(gameName: gameName);
    } else {
      return HomeApp(gameName: gameName);
    }
  }
}
