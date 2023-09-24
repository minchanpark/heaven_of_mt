import 'package:flutter/material.dart';
import 'package:testes/random/set_random.dart';
import 'package:testes/four/set_four.dart';
import 'package:testes/person/set_person.dart';
import 'package:testes/tele/set_tele.dart';
import 'choi/set_choi.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home': (BuildContext context) => const MyHome(),
        '/choi': (BuildContext context) => const ChoiPage(),
        '/four': (BuildContext context) => const FourPage(),
        '/person': (BuildContext context) => const PersonPage(),
        '/random': (BuildContext context) => const RandomPage(),
        '/tele': (BuildContext context) => const TelePage(),
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
  List<String> gameName = ["액션초성게임", "인물퀴즈", "네 글자 퀴즈", "단어텔레파시", "랜덤게임"];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(height: height * 0.15),
                    Image.asset(
                      'assets/images/cloud.png',
                      width: 67,
                      height: 45,
                    ),
                  ],
                ),
                Image.asset('assets/images/title.png', width: 718, height: 96),
                Column(
                  children: [
                    Image.asset(
                      'assets/images/cloud.png',
                      width: 67,
                      height: 45,
                    ),
                    SizedBox(height: height * 0.15),
                  ],
                ),
              ],
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
                      style: const TextStyle(
                        fontFamily: 'DungGeunMo',
                        color: Colors.white,
                        fontSize: 45,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(width: 34),
                    Text(
                      widget.name,
                      style: const TextStyle(
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
                            builder: (context) => const ChoiPage()));
                        break;
                      case '2':
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const PersonPage()));
                        break;
                      case '3':
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const FourPage()));
                        break;
                      case '4':
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const TelePage()));
                        break;
                      case '5':
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const RandomPage()));
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
                      const SizedBox(width: 18),
                      Container(
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, bottom: 5),
                        color: const Color.fromRGBO(255, 98, 211, 1),
                        child: Text(
                          widget.name,
                          style: const TextStyle(
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
