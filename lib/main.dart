// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:testes/random/setRandom.dart';
import 'package:testes/four/setFour.dart';
import 'package:testes/person/setPerson.dart';
import 'package:testes/tele/setTele.dart';
import 'choi/setChoi.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home': (BuildContext context) => MyHome(),
        '/choi': (BuildContext context) => ChoiPage(),
        '/four': (BuildContext context) => FourPage(),
        '/person': (BuildContext context) => PersonPage(),
        '/random': (BuildContext context) => RandomPage(),
        '/tele': (BuildContext context) => TelePage(),
      },
    ),
  );
}

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  List<String> gameName = ["액션초성게임", "인물퀴즈", "네 글자 퀴즈", "텔레파시", "랜덤게임"];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/home.gif'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Center(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(height: height * 0.15),
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  colors: <Color>[
                    Color.fromRGBO(255, 0, 142, 1),
                    Color.fromRGBO(255, 235, 90, 1)
                  ],
                  begin: Alignment.topCenter, // 그라데이션 시작 위치 (위쪽 중앙)
                  end: Alignment.bottomCenter, // 그라데이션 끝 위치 (아래쪽 중앙)
                ).createShader(bounds);
              },
              child: Text(
                '액션게임천국',
                style: TextStyle(
                  fontFamily: 'DungGeunMo',
                  color: Colors.white,
                  fontSize: 96,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: height * 0.13),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(5, (index) {
                return Column(
                  children: [
                    GameList(index: "${index + 1}", name: gameName[index]),
                    SizedBox(height: height * 0.01)
                  ],
                );
              }),
            ),
          ]),
        ),
      ]),
    );
  }
}

class GameList extends StatefulWidget {
  final String index;
  final String name;
  const GameList({super.key, required this.index, required this.name});

  @override
  State<GameList> createState() => _GameListState();
}

class _GameListState extends State<GameList> {
  bool _isMouseOver = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isMouseOver = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isMouseOver = false;
        });
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 4),
            width: 360,
            height: 64,
            child: Visibility(
              visible: !_isMouseOver,
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      widget.index,
                      style: TextStyle(
                        fontFamily: 'DungGeunMo',
                        color: Colors.white,
                        fontSize: 45,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: 34),
                    Text(
                      widget.name,
                      style: TextStyle(
                        fontFamily: 'DungGeunMo',
                        color: Colors.white,
                        fontSize: 45,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ]),
            ),
          ),
          SizedBox(
            width: 390,
            height: 64,
            child: Visibility(
              visible: _isMouseOver,
              child: ElevatedButton(
                  onPressed: () {
                    switch (widget.index) {
                      case '1':
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ChoiPage()));
                        break;
                      case '2':
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PersonPage()));
                        break;
                      case '3':
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => FourPage()));
                        break;
                      case '4':
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => TelePage()));
                        break;
                      case '5':
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => RandomPage()));
                        break;
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    disabledBackgroundColor: Colors.transparent,
                    foregroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: 32,
                          height: 52,
                          child: Image.asset('assets/images/gameover.png')),
                      SizedBox(width: 18),
                      Container(
                        padding:
                            EdgeInsets.only(left: 10, right: 10, bottom: 5),
                        color: Color.fromRGBO(255, 98, 211, 1),
                        child: Text(
                          widget.name,
                          style: TextStyle(
                            fontFamily: 'DungGeunMo',
                            color: Colors.white,
                            fontSize: 45,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
