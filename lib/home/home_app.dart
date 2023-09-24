import 'package:flutter/material.dart';

import '../choi/choi_page.dart';
import '../four/set_four.dart';
import '../person/set_person.dart';
import '../random/set_random.dart';
import '../tele/set_tele.dart';

class HomeApp extends StatelessWidget {
  const HomeApp({
    super.key,
    required this.width,
    required this.height,
    required this.gameName,
  });

  final double width;
  final double height;
  final List<String> gameName;

  @override
  Widget build(BuildContext context) {
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
            SizedBox(height: height * 0.24),
            Image.asset('assets/images/title.png', width: width*0.91, height: height*0.067),
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
                        fontSize: 34,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(width: 34),
                    Text(
                      widget.name,
                      style: const TextStyle(
                        fontFamily: 'DungGeunMo',
                        color: Colors.white,
                        fontSize: 34,
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
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 5),
                        color: const Color.fromRGBO(255, 98, 211, 1),
                        child: Text(
                          widget.name,
                          style: const TextStyle(
                            fontFamily: 'DungGeunMo',
                            color: Colors.white,
                            fontSize: 34,
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