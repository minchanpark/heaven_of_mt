import 'package:flutter/material.dart';
import 'game_random.dart';
import 'game_random_app.dart';

class RandomGamePage extends StatefulWidget {
  final String id;
  const RandomGamePage({
    super.key,
    required this.id,
  });

  @override
  State<RandomGamePage> createState() => _RandomGamePageState();
}

class _RandomGamePageState extends State<RandomGamePage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    if (width > 500) {
      return RandomWebGame(id: widget.id);
    } else {
      return RandomAppGame(id: widget.id);
    }
  }
}
