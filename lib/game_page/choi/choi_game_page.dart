import 'package:flutter/material.dart';
import 'game_choi.dart';
import 'game_choi_app.dart';

class ChoiGamePage extends StatefulWidget {
  const ChoiGamePage({
    super.key,
  });

  @override
  State<ChoiGamePage> createState() => _ChoiGamePageState();
}

class _ChoiGamePageState extends State<ChoiGamePage> {
  @override
  Widget build(BuildContext context) {
    return const ChoiWebGame();
  }
}
