import 'package:flutter/material.dart';
import 'package:heven_of_mt/person/person_game_page.dart';
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
