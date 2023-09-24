import 'package:flutter/material.dart';
import 'package:testes/random/set_random.dart';
import 'package:testes/four/set_four.dart';
import 'package:testes/person/set_person.dart';
import 'package:testes/tele/set_tele.dart';
import 'choi/set_choi.dart';
import 'home/home.dart';

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
