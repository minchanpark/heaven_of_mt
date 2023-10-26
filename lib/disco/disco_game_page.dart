import 'package:flutter/material.dart';
import 'game_disco.dart';

class DiscoGamePage extends StatefulWidget {
  const DiscoGamePage({
    super.key,
  });

  @override
  State<DiscoGamePage> createState() => _DiscoGamePageState();
}

class _DiscoGamePageState extends State<DiscoGamePage> {
  @override
  Widget build(BuildContext context) {
    
    return const DiscoWebGame();
  }
}
