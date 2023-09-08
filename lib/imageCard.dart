// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'gameContents.dart';

class ImageGameCard extends StatelessWidget {
  final GameContents gameContents;

  const ImageGameCard({
    super.key,
    required this.gameContents,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Image.asset(
      gameContents.name,
      fit: BoxFit.fitHeight, // 이미지가 화면에 맞게 조절되도록 설정합니다.
    );
  }
}
