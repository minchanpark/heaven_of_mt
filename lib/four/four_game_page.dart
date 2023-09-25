import 'package:flutter/material.dart';
import 'game_four.dart';
import 'game_four_app.dart';

class FourGamePage extends StatefulWidget {
  final String id;
  const FourGamePage({
    super.key,
    required this.id,
  });

  @override
  State<FourGamePage> createState() => _FourGamePageState();
}

class _FourGamePageState extends State<FourGamePage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    if (width > 500) {
      return FourWebGame(id: widget.id);
    } else {
      return FourAppGame(id: widget.id);
    }
  }
}
