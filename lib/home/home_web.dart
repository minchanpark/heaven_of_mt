import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../captain/captain_game_page.dart';
import '../choi/choi_game_page.dart';
import '../disco/disco_game_page.dart';
import '../four/four_game_page.dart';
import '../onboarding.dart';
import '../person/person_game_page.dart';
import '../tele/tele_game_page.dart';
import '../telestration/telestration_game_page.dart';

const double _kItemExtent = 50.0;
const List<String> _GameNames = <String>[
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
  @override
  void initState() {
    super.initState();
    focusNode.requestFocus();
  }

  int _selectedGame = 0;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/home.gif'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(height: 47),
          Container(
              margin: const EdgeInsets.only(left: 108),
              child: Image.asset('assets/images/title.png',
                  width: width * 0.15, height: height * 0.038)),
          const SizedBox(height: 27),
          Container(
            margin: const EdgeInsets.only(left: 96),
            child: RawKeyboardListener(
              focusNode: focusNode,
              onKey: (RawKeyEvent event) {
                if (event is RawKeyDownEvent) {
                  if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
                    if (_selectedGame == 8) {
                    } else {
                      setState(() {
                        _selectedGame =
                            (_selectedGame + 1) % _GameNames.length;
                        scr.animateToItem(
                          _selectedGame,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      });
                    }
                  } else if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
                    if (_selectedGame == 0) {
                    } else {
                      setState(() {
                        _selectedGame =
                            (_selectedGame - 1 + _GameNames.length) %
                                _GameNames.length;
                        scr.animateToItem(
                          _selectedGame,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      });
                    }
                  }
                }
              },
              child: Column(
                children: [
                  Row(
                    children: [
                      contentList[_selectedGame],
                      SizedBox(
                        width: 635,
                        height: 671,
                        child: CupertinoPicker(
                          scrollController: scr,
                          magnification: 1.22,
                          squeeze: 1.2,
                          useMagnifier: true,
                          itemExtent: 100,
                          onSelectedItemChanged: (int selectedItem) {
                            setState(() {
                              _selectedGame = selectedItem;
                              debugPrint("$_selectedGame");
                            });
                          },
                          selectionOverlay: null,
                          children: List<Widget>.generate(_GameNames.length,
                              (int index) {
                            final isSelected = index == _selectedGame;
                            return Center(
                                child: isSelected
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset("assets/images/left.png",
                                              width: 24, height: 42),
                                          const SizedBox(width: 18),
                                          InkWell(
                                            onTap: () {
                                              switch (_selectedGame + 1) {
                                                case 1: // 인물퀴즈
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const PersonGamePage()));
                                                  break;
                                                case 2: // 디스코
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const DiscoGamePage()));
                                                  break;
                                                case 3: // 대표게임
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const CaptainGamePage()));
                                                  break;
                                                case 4: // 네글자퀴즈
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const FourGamePage()));
                                                  break;
                                                case 5: // 단어텔레파시
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const TeleGamePage()));
                                                  break;
                                                case 6: // 텔레스트레이션
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const TelestrationGamePage()));
                                                  break;
                                                case 7: // 액션초성게임
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const ChoiGamePage()));
                                                  break;
                                                case 8: // 노래초성퀴즈
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const ChoiGamePage()));
                                                  break;
                                                case 9: // 명대사퀴즈
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const ChoiGamePage()));
                                                  break;
                                              }
                                            },
                                            child: Container(
                                              width: 330,
                                              height: 59,
                                              decoration: const BoxDecoration(
                                                  color: Color(0xFFFF62D3)),
                                              child: Center(
                                                child: Text(
                                                  _GameNames[index],
                                                  style: const TextStyle(
                                                      fontFamily: 'DungGeunMo',
                                                      fontSize: 44,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 18),
                                          Image.asset("assets/images/right.png",
                                              width: 24, height: 42)
                                        ],
                                      )
                                    : Text(_GameNames[index],
                                        style: TextStyle(
                                            fontFamily: 'DungGeunMo',
                                            fontSize: 44,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white
                                                .withOpacity(0.5))));
                          }),
                        ),
                      ),
                    ],
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
