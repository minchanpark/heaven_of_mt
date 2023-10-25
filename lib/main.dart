import 'package:flutter/material.dart';
import 'home/home.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home': (BuildContext context) => const MyHome(),
      },
    ),
  );
}
