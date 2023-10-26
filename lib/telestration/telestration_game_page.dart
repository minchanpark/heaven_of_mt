import 'package:flutter/material.dart';
import 'game_telestration.dart';

class TelestrationGamePage extends StatefulWidget {
  const TelestrationGamePage({
    super.key,
  });

  @override
  State<TelestrationGamePage> createState() => _TelestrationGamePageState();
}

class _TelestrationGamePageState extends State<TelestrationGamePage> {
  @override
  Widget build(BuildContext context) {
    
    return const TelestrationWebGame();
  }
}
