import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../captain/captain_game_page.dart';
import '../disco/disco_game_page.dart';
import '../movie/movie_game_page.dart';
import '../musictitle/category_musictitle.dart';
import '../choi/choi_game_page.dart';
import '../four/four_game_page.dart';
import '../onboarding.dart';
import '../person/person_game_page.dart';
import '../tele/tele_game_page.dart';
import '../telestration/telestration_game_page.dart';

// 게임 이름 목록
const List<String> _gameNames = <String>[
  '인물퀴즈',
  '디스코',
  '대표게임',
  '네글자퀴즈',
  '단어텔레파시',
  '텔레스트레이션',
  '액션초성게임',
  '노래초성퀴즈',
  '명대사퀴즈',
];

// 게임 설명 목록
List<Widget> contentList = [
  const PersonOnboarding(),
  const DiscoOnboarding(),
  const CaptainOnboarding(),
  const FourOnboarding(),
  const WordTeleOnboarding(),
  const TeleStrationOnboarding(),
  const ChoiOnboarding(),
  const MusicOnboarding(),
  const FamousLineOnboarding(),
];

// 게임 페이지 묵룩
List<Widget> pageList = [
  const PersonGamePage(),
  const DiscoGamePage(),
  const CaptainGamePage(),
  const FourGamePage(),
  const TeleGamePage(),
  const TelestrationGamePage(),
  const ChoiGamePage(),
  const CategoryPage(),
  const MovieGamePage(),
];

class HomeWeb extends StatefulWidget {
  const HomeWeb({
    super.key,
  });
  @override
  State<HomeWeb> createState() => _HomeWebState();
}

class _HomeWebState extends State<HomeWeb> {
  FocusNode focusNode = FocusNode();
  FixedExtentScrollController scr = FixedExtentScrollController();
  int _selectedGame = 0;

  // 게임 선택 로직
  void selectGame() {
    switch (_selectedGame + 1) {
      case 1:
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const PersonGamePage()));
        break;
      case 2:
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const DiscoGamePage()));
        break;
      case 3:
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const CaptainGamePage()));
        break;
      case 4:
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const FourGamePage()));
        break;
      case 5:
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const TeleGamePage()));
        break;
      case 6:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const TelestrationGamePage()));
        break;
      case 7:
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const ChoiGamePage()));
        break;
      case 8:
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const CategoryPage()));
        break;
      case 9:
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const MovieGamePage()));
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    focusNode.requestFocus();
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
              image: AssetImage('assets/images/background_final.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // 홈 화면 구성
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: height * 0.056),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/splash');
            },
            child: Container(
                margin: EdgeInsets.only(left: width * 0.075),
                child: Image.asset('assets/images/title.png',
                    width: width * 0.179, height: height * 0.047)),
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
                      diameterRatio: 1000,
                      scrollController: scr,
                      // magnification: 1.22,
                      squeeze: 0.8,
                      // useMagnifier: true,
                      itemExtent: 59,
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
                                        Image.asset("assets/images/left.png",
                                            width: 24, height: 42),
                                        const SizedBox(width: 18),
                                        Container(
                                          width: 382,
                                          height: 59,
                                          decoration: const BoxDecoration(
                                              color: Color(0xFFFF62D3)),
                                          child: Center(
                                            child: Text(
                                              _gameNames[index],
                                              style: const TextStyle(
                                                  fontFamily: 'DungGeunMo',
                                                  fontSize: 54,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 18),
                                        Image.asset("assets/images/right.png",
                                            width: 24, height: 42)
                                      ],
                                    ),
                                  )
                                : Text(_gameNames[index],
                                    style: TextStyle(
                                        fontFamily: 'DungGeunMo',
                                        fontSize: 44,
                                        fontWeight: FontWeight.w400,
                                        color:
                                            Colors.white.withOpacity(0.5))));
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
