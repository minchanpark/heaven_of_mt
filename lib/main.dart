import 'package:flutter/material.dart';
import 'package:testes/person/person_game_page.dart';
import 'home/home.dart';
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
      },
    ),
  );
}
