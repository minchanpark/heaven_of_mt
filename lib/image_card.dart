import 'package:flutter/material.dart';
import 'game_contents.dart';

class ImageGameCard extends StatelessWidget {
  final GameContents gameContents;

  const ImageGameCard({
    super.key,
    required this.gameContents,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      gameContents.name,
      fit: BoxFit.fitHeight, // 이미지가 화면에 맞게 조절되도록 설정합니다.
    );
  }
}
