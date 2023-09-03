import 'package:flutter/material.dart';
import 'package:testes/choi/Gamepage_choi.dart';
import 'package:testes/main.dart';

class GameOver extends StatefulWidget {
  final String id;
  const GameOver({super.key, required this.id});

  @override
  State<GameOver> createState() => _GameOverState();
}

class _GameOverState extends State<GameOver> {
  String setNumber ='';
  @override
  void initState(){
    super.initState();
    setNumber = widget.id;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            'SET $setNumber',
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 50,
            ),
          ),
          const Text('Game Over!!', style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 50,
            ),),
          ElevatedButton(
            onPressed: (){Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            ChoiGame(id: widget.id), // Beauty 이미지에 대한 페이지
                      ));},
            child: Text('Play Again'),
          ),
          ElevatedButton(
            onPressed: (){Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            const MyHome(), // Beauty 이미지에 대한 페이지
                      ),
                    );},
            child: Text('Go Home'),
          ),
        ],
      )
    );
  }
}