import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'dart:math';

import '../../game_contents.dart';
import '../../card/card.dart';
import '../../gameover/gameover_web.dart';
import '../../ready.dart';

class CaptainWebGame extends StatefulWidget {
  const CaptainWebGame({
    super.key,
  });

  @override
  State<CaptainWebGame> createState() => _CaptainWebGamePageState();
}

class _CaptainWebGamePageState extends State<CaptainWebGame> {
  FocusNode focusNode = FocusNode();
  int currentCardIndex = 0; // 현재 카드의 인덱스를 저장할 변수
  final CardSwiperController controller = CardSwiperController();
  List<GameCard> cards = []; // cards 변수를 초기화
  List<GameCard> answer_cards = [];
  final random = Random();
  bool _isAnswered = false;
  List<GameContents> randomcaptain = [];
  @override
  void initState() {
    super.initState();
    focusNode.requestFocus();
    FirebaseAnalytics.instance.logScreenView(screenName: "대표게임");
    // widget.id 값에 따라 cards 변수에 값을 할당

    final captainIndices = List<int>.generate(captain.length, (i) => i)
      ..shuffle(random);
    randomcaptain =
        captainIndices.sublist(0, 10).map((index) => captain[index]).toList();
  }

  bool isUndoButtonVisible = true;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    cards = randomcaptain
        .map((gameContents) =>
            GameCard(gameContents: gameContents, fontSize: width * 0.058))
        .toList();
    answer_cards = randomcaptain
        .map((gameContents) => GameCard(
            gameContents: gameContents, answer: true, fontSize: width * 0.058))
        .toList();
    if (width < 1126 || height < 627) return ReadyPage();
    return Scaffold(
      backgroundColor: const Color.fromRGBO(14, 25, 62, 1),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background_final.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Center(
              child: Container(
                padding: EdgeInsets.only(
                  left: width * 0.075,
                  top: height * 0.073,
                  right: width * 0.075,
                ),
                child: RawKeyboardListener(
                  focusNode: focusNode,
                  onKey: (RawKeyEvent event) {
                    if (event is RawKeyDownEvent) {
                      if (event.logicalKey == LogicalKeyboardKey.escape) {
                        Navigator.of(context).pop();
                      } else if (event.logicalKey == LogicalKeyboardKey.space ||
                          event.logicalKey == LogicalKeyboardKey.enter) {
                        setState(() {
                          _isAnswered = !_isAnswered;
                        });
                      } else if (event.logicalKey ==
                          LogicalKeyboardKey.arrowLeft) {
                        controller.undo();
                        _isAnswered = false;
                        if (currentCardIndex == 0) {
                          setState(() {
                            isUndoButtonVisible = true;
                          });
                        }
                      } else if (event.logicalKey ==
                          LogicalKeyboardKey.arrowRight) {
                        _isAnswered = false;
                        if (currentCardIndex == 9) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const GameOver(
                                gameName: 'captain',
                              ),
                            ),
                          );
                        } else {
                          controller.swipeLeft();
                          if (currentCardIndex != 2) {
                            setState(() {
                              isUndoButtonVisible = false;
                            });
                          }
                        }
                      }
                    }
                  },
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            color: Colors.white,
                            icon: const ImageIcon(
                                AssetImage('assets/images/Exit.png')),
                            iconSize: width * 0.03,
                          ),
                          const Spacer(),
                          Text(
                            '${currentCardIndex + 1}/${cards.length}',
                            style: TextStyle(
                              fontFamily: 'DungGeunMo',
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: width * 0.033,
                            ),
                          ),
                          const Spacer(),
                          SizedBox(width: width * 0.039),
                        ],
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            isUndoButtonVisible
                                ? GestureDetector(
                                    onTap: () {
                                      controller.undo();
                                      _isAnswered = false;
                                    },
                                    child: Image.asset(
                                      'assets/images/icon_chevron_left.png',
                                      height: width * 0.07,
                                    ))
                                : GestureDetector(
                                    onTap: () {
                                      controller.undo();
                                      _isAnswered = false;
                                      if (currentCardIndex == 0) {
                                        setState(() {
                                          isUndoButtonVisible = true;
                                        });
                                      }
                                    },
                                    child: Image.asset(
                                      'assets/images/icon_chevron_left_white.png',
                                      height: width * 0.07,
                                    )),
                            SizedBox(
                              width: width * 0.7,
                              height: height * 0.4,
                              child: CardSwiper(
                                duration: const Duration(milliseconds: 0),
                                controller: controller,
                                cardsCount: cards.length,
                                numberOfCardsDisplayed: 1,
                                cardBuilder: (
                                  context,
                                  index,
                                  horizontalThresholdPercentage,
                                  verticalThresholdPercentage,
                                ) {
                                  currentCardIndex = index;
                                  return !_isAnswered
                                      ? cards[index]
                                      : answer_cards[index];
                                },
                                isDisabled: true,
                                onSwipe: _onSwipe,
                                onUndo: _onUndo,
                              ),
                            ),
                            GestureDetector(
                                onTap: () {
                                  if (currentCardIndex == 9) {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => const GameOver(
                                          gameName: 'captain',
                                        ),
                                      ),
                                    );
                                  } else {
                                    controller.swipeLeft();
                                    if (currentCardIndex != 2) {
                                      setState(() {
                                        isUndoButtonVisible = false;
                                      });
                                    }
                                  }
                                  _isAnswered = false;
                                },
                                child: Image.asset(
                                  'assets/images/icon_chevron_right.png',
                                  height: width * 0.07,
                                ))
                          ],
                        ),
                      ),
                      SizedBox(
                        width: width * 0.173,
                        height: height * 0.085,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _isAnswered = !_isAnswered;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _isAnswered
                                ? Colors.white
                                : const Color(0xffFF62D3),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          child: Text(
                            _isAnswered ? '돌아가기' : '미션보기',
                            style: TextStyle(
                              fontFamily: 'DungGeunMo',
                              fontWeight: FontWeight.w400,
                              fontSize: width * 0.03,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.1),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  bool _onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    setState(() {
      currentCardIndex = currentIndex ?? 0; // currentIndex가 null인 경우 기본값 0으로 설정
    });

    return true;
  }

  bool _onUndo(
    int? previousIndex,
    int currentIndex,
    CardSwiperDirection direction,
  ) {
    setState(() {
      currentCardIndex = currentIndex; // currentIndex가 null인 경우 기본값 0으로 설정
    });
    return true;
  }
}
