import 'package:flutter/material.dart';

import '../church_game/church_captain.dart';

class ChurchPage extends StatelessWidget {
  const ChurchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ChurchCaptainGame()));
            }, child: const Text("이미지 게임")),
            TextButton(onPressed: (){}, child: const Text("네글자 게임")),
            TextButton(onPressed: (){}, child: const Text("디스코 게임")),
          ]),
      ),
    );
  }
}
