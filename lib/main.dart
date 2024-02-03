import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'home/home_church.dart';
import 'home/home.dart';
import 'game_page/person/person_game_page.dart';
import 'splash.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        '/splash': (BuildContext context) => const SplashPage(),
        '/home': (BuildContext context) => const MyHome(),
        '/person': (BuildContext context) => const PersonGamePage(),
        '/church': (BuildContext context) => const ChurchPage(),
      },
    ),
  );
  js.context.callMethod('ChannelIO', ['boot', {
    "pluginKey": "4cf501ee-0328-4a70-af7e-edb184d5981f"
  }]);
}
