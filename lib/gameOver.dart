// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:testes/main.dart';

import 'brand/setBrand.dart';
import 'choi/setChoi.dart';
import 'four/setFour.dart';


class GameOver extends StatefulWidget {
  final String id;
  final String gameName;
  const GameOver({super.key, required this.id, required this.gameName});

  @override
  State<GameOver> createState() => _GameOverState();
}

class _GameOverState extends State<GameOver> {
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
      child: Container(
        color: const Color.fromRGBO(14, 25, 62, 1),
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: height*0.191),
            Text(
              setNumber,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 48,
              ),
            ),
            SizedBox(height: height*0.048),
            const Text(
              '모든 문제를 완료했어요!',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 48,
              ),
            ),
            SizedBox(height: height*0.1695),
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
                    duration: Duration(milliseconds: 300), // 애니메이션 지속 시간 조절
                    decoration: BoxDecoration(
                      color: Colors.transparent, // 배경색을 지정합니다.
                      borderRadius:
                          BorderRadius.circular(20.0), // 원하는 반지름 값으로 조절
                    ),
                    width: 360,
                    height: 64,
                    child: Center(
                      child: Text(
                        'Play Again',
                        style: TextStyle(
                          fontFamily: 'Pretendard',
                          color: Colors.white,
                          fontSize: 48,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 1,
                    right: 52,
                    child: AnimatedOpacity(
                      duration: Duration(milliseconds: 0), // 애니메이션 지속 시간 조절
                      opacity: _opacity == 0 ? 1.0 : 0.0,
                      child: ElevatedButton(
                          onPressed: () {
                            if (widget.gameName == 'choi') {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ChoiPage(), // Beauty 이미지에 대한 페이지
                                ),
                              );
                            } else if (widget.gameName == 'four') {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      FourPage(), // Beauty 이미지에 대한 페이지
                                ),
                              );
                            } else if (widget.gameName == 'brand') {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      BrandPage(), // Beauty 이미지에 대한 페이지
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(14, 25, 62, 1), // 기본 배경 색상
                            disabledBackgroundColor:
                                const Color.fromRGBO(14, 25, 62, 1), // 기본 배경 색상
                            foregroundColor:
                                const Color.fromRGBO(14, 25, 62, 1), // 기본 배경 색상
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(11),
                            ),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                  width: 29,
                                  height: 51,
                                  child: Image.asset(
                                      'assets/images/gameover.png')),
                              SizedBox(width: 34),
                              Container(
                                color: Color.fromRGBO(255, 98, 211, 1),
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 5),
                                  child: Text(
                                    'Play Again',
                                    style: TextStyle(
                                      fontFamily: 'Pretendard',
                                      color: Colors.white,
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
            SizedBox(height: height*0.048),
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
                    duration: Duration(milliseconds: 300), // 애니메이션 지속 시간 조절
                    decoration: BoxDecoration(
                      color: Colors.transparent, // 배경색을 지정합니다.
                      borderRadius:
                          BorderRadius.circular(20.0), // 원하는 반지름 값으로 조절
                    ),
                    width: 360,
                    height: 64,
                    child: Center(
                      child: Text(
                        'Go Home',
                        style: TextStyle(
                          fontFamily: 'Pretendard',
                          color: Colors.white,
                          fontSize: 48,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 1,
                    right: 63,
                    child: AnimatedOpacity(
                      duration: Duration(milliseconds: 0), // 애니메이션 지속 시간 조절
                      opacity: _opacity1 == 0 ? 1.0 : 0.0,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    MyHome(), // Beauty 이미지에 대한 페이지
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(14, 25, 62, 1), // 기본 배경 색상
                            disabledBackgroundColor:
                                const Color.fromRGBO(14, 25, 62, 1), // 기본 배경 색상
                            foregroundColor:
                                const Color.fromRGBO(14, 25, 62, 1), // 기본 배경 색상
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(11),
                            ),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                  width: 29,
                                  height: 51,
                                  child: Image.asset(
                                      'assets/images/gameover.png')),
                              SizedBox(width: 43),
                              Container(
                                color: Color.fromRGBO(255, 98, 211, 1),
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 5),
                                  child: Text(
                                    'Go Home',
                                    style: TextStyle(
                                      fontFamily: 'Pretendard',
                                      color: Colors.white,
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
          ],
        ),
      ),
    ));
  }
}
