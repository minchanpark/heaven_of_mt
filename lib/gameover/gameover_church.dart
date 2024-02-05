// ignore_for_file: unused_field

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../church_game/church_captain.dart';
import '../church_game/church_disco.dart';
import '../church_game/church_four.dart';
import '../ready_church.dart';

class GameOverChurch extends StatefulWidget {
  final String gameName;
  const GameOverChurch({super.key, required this.gameName});

  @override
  State<GameOverChurch> createState() => _GameOverChurchState();
}

class _GameOverChurchState extends State<GameOverChurch> {
  String setNumber = '';

  @override
  void initState() {
    super.initState();
    FirebaseAnalytics.instance.setCurrentScreen(screenName: "게임오버_교회");
  }

  double _opacity = 0.5;
  double _opacity1 = 0.5;
  bool _isMouseOver = false;
  bool _isMouseOver1 = false;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    if (width < 1126 || height < 627) return ReadyChurchPage();
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/feedback_church.gif'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(height: height * 0.187),
                const Text(
                  '모든 문제를 완료했어요!',
                  style: TextStyle(
                    fontFamily: 'DungGeunMo',
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 48,
                  ),
                ),
                SizedBox(height: height * 0.188),
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
                      AnimatedContainer(
                        padding: const EdgeInsets.only(bottom: 4),
                        duration:
                            const Duration(milliseconds: 300), // 애니메이션 지속 시간 조절
                        decoration: BoxDecoration(
                          color: Colors.transparent, // 배경색을 지정합니다.
                          borderRadius:
                              BorderRadius.circular(20.0), // 원하는 반지름 값으로 조절
                        ),
                        width: 360,
                        height: 64,
                        child: const Center(
                          child: Text(
                            'Play Again',
                            style: TextStyle(
                              fontFamily: 'DungGeunMo',
                              color: Colors.black,
                              fontSize: 48,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -10,
                        right: 59,
                        child: AnimatedOpacity(
                          duration:
                              const Duration(milliseconds: 0), // 애니메이션 지속 시간 조절
                          opacity: _opacity == 0 ? 1.0 : 0.0,
                          child: GestureDetector(
                              onTap: () {
                                Navigator.popUntil(
                                    context, ModalRoute.withName('/church'));
                                switch (widget.gameName) {
                                  case 'churchCaptain':
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ChurchCaptainGame()));
                                    break;
                                  case 'churchFour':
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ChurchFourGame()));
                                    break;
                                  case 'churchDisco':
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ChurchDiscoGame()));
                                    break;
                                  default:
                                    break;
                                }
                              },
                              child: Row(
                                children: [
                                  SizedBox(
                                      width: 32,
                                      height: 52,
                                      child: Image.asset(
                                          'assets/images/gameover.png',
                                          color: const Color(0xFFFFF27F))),
                                  const SizedBox(width: 10),
                                  Container(
                                    color: const Color(0xFFFFF27F),
                                    child: const Padding(
                                      padding: EdgeInsets.only(bottom: 5),
                                      child: Text(
                                        'Play Again',
                                        style: TextStyle(
                                          fontFamily: 'DungGeunMo',
                                          color: Colors.black,
                                          fontSize: 48,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.044),
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
                        width: 360,
                        height: 64,
                        child: const Center(
                          child: Text(
                            'Go Home',
                            style: TextStyle(
                              fontFamily: 'DungGeunMo',
                              color: Colors.black,
                              fontSize: 48,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -10,
                        right: 95,
                        child: AnimatedOpacity(
                          duration:
                              const Duration(milliseconds: 0), // 애니메이션 지속 시간 조절
                          opacity: _opacity1 == 0 ? 1.0 : 0.0,
                          child: GestureDetector(
                              onTap: () {
                                Navigator.popUntil(
                                    context, ModalRoute.withName('/church'));
                              },
                              child: Row(
                                children: [
                                  SizedBox(
                                      width: 29,
                                      height: 51,
                                      child: Image.asset(
                                          'assets/images/gameover.png',
                                          color: const Color(0xFFFFF27F))),
                                  const SizedBox(width: 10),
                                  Container(
                                    color: const Color(0xFFFFF27F),
                                    child: const Padding(
                                      padding: EdgeInsets.only(bottom: 5),
                                      child: Text(
                                        'Go Home',
                                        style: TextStyle(
                                          fontFamily: 'DungGeunMo',
                                          color: Colors.black,
                                          fontSize: 48,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () async {
                    const url = 'https://walla.my/survey/fdLq6GUHt5S7kNbDMZsj';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Text(
                    '의견보내기',
                    style: TextStyle(
                      fontFamily: 'DungGeunMo',
                      color: Colors.white,
                      fontSize: width * 0.025,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
