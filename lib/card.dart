// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'gameContents.dart';

class GameCard extends StatelessWidget {
  final GameContents gameContents;

  const GameCard({
    super.key,
    required this.gameContents,
  });

  // Widget switchWidget(String contents) {
  //   int? index;
  //   if (contents.contains("choi")) {
  //     index == 1;
  //   } else if (contents.contains("person")) {
  //     index == 2;
  //   } else if (contents.contains("four")) {
  //     index == 3;
  //   } else if (contents.contains("tele")) {
  //     index == 4;
  //   } else {
  //     index == 5;
  //   }

  //   switch (index) {
  //     case 1:
  //       return Text(
  //         gameContents.name,
  //         style: const TextStyle(
  //           color: Colors.white,
  //           fontWeight: FontWeight.w700,
  //           fontSize: 240,
  //         ),
  //       );
  //     case 2:
  //       return Image.asset(gameContents.name);
  //     case 3:
  //       return Text(
  //         gameContents.name,
  //         style: const TextStyle(
  //           color: Colors.white,
  //           fontWeight: FontWeight.w700,
  //           fontSize: 200,
  //         ),
  //       );
  //     case 4:
  //       return Text(
  //         gameContents.name,
  //         style: const TextStyle(
  //           color: Colors.white,
  //           fontWeight: FontWeight.w700,
  //           fontSize: 200,
  //         ),
  //       );
  //     case 5:
  //       break;
  //     default:
  //       break;
  //   }
  //   return SizedBox();
  // }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform.translate(
        offset: Offset(0, -45), // 위로 이동할 양을 조정하십시오.
        child: Text(
          gameContents.name,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 200,
          ),
        ),
      ),
    );
  }
}
