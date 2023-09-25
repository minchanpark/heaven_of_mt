import 'package:flutter/material.dart';

import '../choi/choi_page.dart';
import '../four/four_page.dart';
import '../person/person_page.dart';
import '../random/random_page.dart';
import '../tele/tele_page.dart';

class GameOverApp extends StatefulWidget {
  final String id;
  final String gameName;
  const GameOverApp({super.key, required this.id, required this.gameName});

  @override
  State<GameOverApp> createState() => _GameOverAppState();
}

class _GameOverAppState extends State<GameOverApp> {
  String setNumber = '';
  @override
  void initState() {
    super.initState();
    setNumber = widget.id;
  }

  double _opacity = 0.5;
  double _opacity1 = 0.5;
  bool _isMouseOver = false;
  bool _isMouseOver1 = false;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/home.gif'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            child: Column(
              children: [
                SizedBox(height: height * 0.213),
                Text(
                  setNumber,
                  style: const TextStyle(
                    fontFamily: 'DungGeunMo',
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 36,
                  ),
                ),
                SizedBox(height: height * 0.01),
                const Text(
                  '모든 문제를 완료했어요!',
                  style: TextStyle(
                    fontFamily: 'DungGeunMo',
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 25,
                  ),
                ),
                SizedBox(height: height * 0.138),
                MouseRegion(
                  cursor: SystemMouseCursors.click, // 마우스 커서를 클릭 스타일로 설정
                  onEnter: (_) {
                    setState(() {
                      _isMouseOver = true;
                      _opacity = 0.0;
                    });
                  },
                  onExit: (_) {
                    setState(() {
                      _isMouseOver = false;
                      _opacity = 0.5;
                    });
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 4),
                        width: 300,
                        height: 60,
                        child: const Center(
                          child: Text(
                            'Play Again',
                            style: TextStyle(
                              fontFamily: 'DungGeunMo',
                              color: Colors.white,
                              fontSize: 45,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        child: AnimatedOpacity(
                          duration:
                              const Duration(milliseconds: 0), // 애니메이션 지속 시간 조절
                          opacity: _opacity == 0 ? 1.0 : 0.0,
                          child: ElevatedButton(
                              onPressed: () {
                                if (widget.gameName == 'choi') {
                                  Navigator.popUntil(
                                      context, ModalRoute.withName('/home'));
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const ChoiPage()));
                                } else if (widget.gameName == 'person') {
                                  Navigator.popUntil(
                                      context, ModalRoute.withName('/home'));
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const PersonPage()));
                                } else if (widget.gameName == 'four') {
                                  Navigator.popUntil(
                                      context, ModalRoute.withName('/home'));
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const FourPage()));
                                } else if (widget.gameName == 'tele') {
                                  Navigator.popUntil(
                                      context, ModalRoute.withName('/home'));
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const TelePage()));
                                } else if (widget.gameName == 'random') {
                                  Navigator.popUntil(
                                      context, ModalRoute.withName('/home'));
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const RandomPage()));
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      width: 18,
                                      height: 32,
                                      child: Image.asset(
                                          'assets/images/gameover.png')),
                                  const SizedBox(width: 13),
                                  Container(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    color:
                                        const Color.fromRGBO(255, 98, 211, 1),
                                    child: const Text(
                                      'Play Again',
                                      style: TextStyle(
                                        fontFamily: 'DungGeunMo',
                                        color: Colors.white,
                                        fontSize: 45,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 31, height: 32)
                                ],
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.04),
                MouseRegion(
                  cursor: SystemMouseCursors.click, // 마우스 커서를 클릭 스타일로 설정
                  onEnter: (_) {
                    setState(() {
                      _isMouseOver1 = true;
                      _opacity1 = 0.0;
                    });
                  },
                  onExit: (_) {
                    setState(() {
                      _isMouseOver1 = false;
                      _opacity1 = 0.5;
                    });
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      AnimatedContainer(
                        padding: const EdgeInsets.only(bottom: 4),
                        duration:
                            const Duration(milliseconds: 300), // 애니메이션 지속 시간 조절
                        decoration: BoxDecoration(
                          color: Colors.transparent, // 배경색을 지정합니다.
                          borderRadius:
                              BorderRadius.circular(20.0), // 원하는 반지름 값으로 조절
                        ),
                        width: 230,
                        height: 50,
                        child: const Center(
                          child: Text(
                            'Go Home',
                            style: TextStyle(
                              fontFamily: 'DungGeunMo',
                              color: Colors.white,
                              fontSize: 45,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        child: AnimatedOpacity(
                          duration:
                              const Duration(milliseconds: 0), // 애니메이션 지속 시간 조절
                          opacity: _opacity1 == 0 ? 1.0 : 0.0,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.popUntil(
                                    context, ModalRoute.withName('/home'));
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      width: 18,
                                      height: 32,
                                      child: Image.asset(
                                          'assets/images/gameover.png')),
                                  const SizedBox(width: 13),
                                  Container(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    color:
                                        const Color.fromRGBO(255, 98, 211, 1),
                                    child: const Text(
                                      'Go Home',
                                      style: TextStyle(
                                        fontFamily: 'DungGeunMo',
                                        color: Colors.white,
                                        fontSize: 45,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 31, height: 32)
                                ],
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
