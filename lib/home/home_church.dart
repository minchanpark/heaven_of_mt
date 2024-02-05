import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../church_game/church_captain.dart';
import '../church_game/church_disco.dart';
import '../church_game/church_four.dart';
import '../onboarding_church.dart';

final List<String> _gameNames = <String>[
  '디스코',
  '이미지게임',
  '네글자퀴즈',
];

List<Widget> contentList = [
  ChurchDiscoOnboarding(),
  ChurchCaptainOnboarding(),
  ChurchFourOnboarding(),
];

List<Widget> pageList = [
  const ChurchDiscoGame(),
  const ChurchCaptainGame(),
  const ChurchFourGame(),
];

class ChurchPage extends StatefulWidget {
  const ChurchPage({super.key});

  @override
  State<ChurchPage> createState() => _ChurchPageState();
}

class _ChurchPageState extends State<ChurchPage> {
  FocusNode focusNode = FocusNode();
  FixedExtentScrollController scr = FixedExtentScrollController();
  int _selectedGame = 0;

  // 게임 선택 로직
  void selectGame() {
    switch (_selectedGame + 1) {
      case 1:
        Navigator.pushNamed(context, '/church_disco');
        break;
      case 2:
        Navigator.pushNamed(context, '/church_captain');
        break;
      case 3:
        Navigator.pushNamed(context, '/church_four');
        break;
      default:
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    focusNode.requestFocus();
    FirebaseAnalytics.instance.setCurrentScreen(screenName: "교회홈화면");
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(children: [
        // 배경
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background_church.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // 홈 화면 구성
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: height * 0.056),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/splash');
                },
                child: Container(
                    margin: EdgeInsets.only(left: width * 0.075),
                    child: Image.asset('assets/images/title.png',
                        width: width * 0.179, height: height * 0.047)),
              ),
              const Spacer(),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed('/home');
                  },
                  child: Container(
                      padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xffFF008E), Color(0xffFFEB50)])),
                      child: Text("엠티게임천국 바로가기",
                          style: TextStyle(
                            fontFamily: 'DungGeunMo',
                            color: Colors.black,
                            fontSize: width * 0.0125,
                          )))),
              SizedBox(width: width * 0.015),
              GestureDetector(
                  onTap: () {},
                  child: Container(
                      padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xffFF008E), Color(0xffFFEB50)])),
                      child: Text("팀 소개",
                          style: TextStyle(
                            fontFamily: 'DungGeunMo',
                            color: Colors.black,
                            fontSize: width * 0.0125,
                          )))),
              SizedBox(width: width * 0.075)
            ],
          ),
          SizedBox(height: height * 0.032),
          Container(
            margin: EdgeInsets.only(left: width * 0.075),
            // 키보드 interaction
            child: RawKeyboardListener(
              focusNode: focusNode,
              onKey: (RawKeyEvent event) {
                if (event is RawKeyDownEvent) {
                  // 키보드 아래 화살표
                  if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
                    if (_selectedGame == 8) {
                    } else {
                      setState(() {
                        _selectedGame = (_selectedGame + 1) % _gameNames.length;
                        scr.animateToItem(
                          _selectedGame,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      });
                    }
                    // 키보드 위 화살표
                  } else if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
                    if (_selectedGame == 0) {
                    } else {
                      setState(() {
                        _selectedGame =
                            (_selectedGame - 1 + _gameNames.length) %
                                _gameNames.length;
                        scr.animateToItem(
                          _selectedGame,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      });
                    }
                    // 키보드 엔터 시 게임 화면으로 이동
                  } else if (event.logicalKey == LogicalKeyboardKey.enter) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => pageList[_selectedGame]));
                  }
                }
              },
              child: Row(
                children: [
                  // 설명란
                  contentList[_selectedGame],
                  SizedBox(width: width * 0.063),
                  SizedBox(
                    width: width * 0.4,
                    height: height * 0.81,
                    child: CupertinoPicker(
                      // diameterRatio: 1.5,
                      diameterRatio: 500,
                      scrollController: scr,
                      // magnification: 1.22,
                      squeeze: 0.8,
                      // useMagnifier: true,
                      itemExtent: width * 0.041,
                      onSelectedItemChanged: (int selectedItem) {
                        setState(() {
                          _selectedGame = selectedItem;
                        });
                      },
                      selectionOverlay: null,
                      children:
                          // 게임 목록 선택 화면
                          List<Widget>.generate(_gameNames.length, (int index) {
                        final isSelected = (index == _selectedGame);
                        return Center(
                            child: isSelected
                                // 선택 되어있을 때 보여줄 ui
                                ? GestureDetector(
                                    onTap: selectGame,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          "assets/images/left.png",
                                          width: 24,
                                          height: 42,
                                          color: const Color(0xffFFF27F),
                                        ),
                                        const SizedBox(width: 18),
                                        Container(
                                          width: width * 0.265,
                                          decoration: const BoxDecoration(
                                              color: Color(0xFFFFF27F)),
                                          child: Center(
                                            child: Text(
                                              _gameNames[index],
                                              style: TextStyle(
                                                  fontFamily: 'DungGeunMo',
                                                  fontSize: width * 0.0375,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 18),
                                        Image.asset(
                                          "assets/images/right.png",
                                          width: 24,
                                          height: 42,
                                          color: const Color(0xffFFF27F),
                                        )
                                      ],
                                    ),
                                  )
                                : Text(_gameNames[index],
                                    style: TextStyle(
                                        fontFamily: 'DungGeunMo',
                                        fontSize: width * 0.03,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black.withOpacity(0.5))));
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ]),
    );
  }
}
