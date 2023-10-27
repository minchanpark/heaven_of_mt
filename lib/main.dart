import 'package:flutter/material.dart';
import 'splash.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        '/splash': (BuildContext context) => const SplashPage(),
      },
    ),
  );
}
