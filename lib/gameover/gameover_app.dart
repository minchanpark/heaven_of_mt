import 'package:flutter/material.dart';

import '../home/home.dart';

class GameOverApp extends StatefulWidget {
  final String gameName;
  const GameOverApp({super.key, required this.gameName});

  @override
  State<GameOverApp> createState() => _GameOverAppState();
}

class _GameOverAppState extends State<GameOverApp> {
  String setNumber = '';
  @override
  void initState() {
    super.initState();
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
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                        child: Visibility(
                          visible: !_isMouseOver,
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
                      ),
                      Container(
                        padding: const EdgeInsets.only(bottom: 4),
                        width: 340,
                        height: 60,
                        child: Visibility(
                          visible: _isMouseOver,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.popUntil(
                                    context, ModalRoute.withName('/home'));
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const MyHome()));
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
                      Center(
                        child: Container(
                          padding: const EdgeInsets.only(bottom: 4),
                          width: 180,
                          height: 70,
                          child: Visibility(
                            visible: !_isMouseOver1,
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
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(bottom: 4),
                        width: 280,
                        height: 70,
                        child: Visibility(
                          visible: _isMouseOver1,
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
