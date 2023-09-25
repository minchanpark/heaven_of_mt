import 'package:flutter/material.dart';
import 'choi/choi_page.dart';
import 'four/four_page.dart';
import 'home/home.dart';
import 'person/person_page.dart';
import 'random/random_page.dart';
import 'tele/tele_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home': (BuildContext context) => const MyHome(),
        '/choi': (BuildContext context) => const ChoiPage(),
        '/four': (BuildContext context) => const FourPage(),
        '/person': (BuildContext context) => const PersonPage(),
        '/random': (BuildContext context) => const RandomPage(),
        '/tele': (BuildContext context) => const TelePage(),
      },
    ),
  );
}
