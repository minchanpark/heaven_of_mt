import 'package:flutter/material.dart';
import 'game_choi.dart';
import 'game_choi_app.dart';

class ChoiGamePage extends StatefulWidget {
  final String id;
  const ChoiGamePage({
    super.key,
    required this.id,
  });

  @override
  State<ChoiGamePage> createState() => _ChoiGamePageState();
}

class _ChoiGamePageState extends State<ChoiGamePage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    if (width > 500) {
      return ChoiWebGame(id: widget.id);
    } else {
      return ChoiAppGame(id: widget.id);
    }
  }
}
