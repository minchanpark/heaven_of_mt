import 'package:flutter/material.dart';
import 'game_tele.dart';
import 'game_tele_app.dart';

class TeleGamePage extends StatefulWidget {
  const TeleGamePage({super.key});

  @override
  State<TeleGamePage> createState() => _TeleGamePageState();
}

class _TeleGamePageState extends State<TeleGamePage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    if (width > 500) {
      return TeleWebGame();
    } else {
      return TeleAppGame();
    }
  }
}
