// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'gameContents.dart';

class GameCard extends StatelessWidget {
  final GameContents candidate;

  const GameCard({
    super.key,
    required this.candidate, 
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform.translate(
        offset: Offset(0, -45), // 위로 이동할 양을 조정하십시오.
        child: Text(
          candidate.name,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 240,
          ),
        ),
      ),
    );
  }
}
