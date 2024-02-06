import 'package:flutter/material.dart';
import 'game_four.dart';
import 'game_four_app.dart';

class FourGamePage extends StatefulWidget {
  const FourGamePage({
    super.key,
  });

  @override
  State<FourGamePage> createState() => _FourGamePageState();
}

class _FourGamePageState extends State<FourGamePage> {
  @override
  Widget build(BuildContext context) {
    return const FourWebGame();
  }
}
