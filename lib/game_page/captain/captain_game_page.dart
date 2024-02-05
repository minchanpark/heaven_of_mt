import 'package:flutter/material.dart';
import 'game_captain.dart';

class CaptainGamePage extends StatefulWidget {
  const CaptainGamePage({
    super.key,
  });

  @override
  State<CaptainGamePage> createState() => _CaptainGamePageState();
}

class _CaptainGamePageState extends State<CaptainGamePage> {
  @override
  Widget build(BuildContext context) {
    return const CaptainWebGame();
  }
}
