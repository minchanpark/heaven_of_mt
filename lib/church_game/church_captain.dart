import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'dart:math';

import '../../game_contents.dart';
import '../../card/card.dart';
import '../gameover/gameover_church.dart';
import 'church_contents.dart';

class ChurchCaptainGame extends StatefulWidget {
  const ChurchCaptainGame({
    super.key,
  });

  @override
  State<ChurchCaptainGame> createState() => _ChurchCaptainGamePageState();
}

class _ChurchCaptainGamePageState extends State<ChurchCaptainGame> {
  FocusNode focusNode = FocusNode();
  int currentCardIndex = 0; // 현재 카드의 인덱스를 저장할 변수
  final CardSwiperController controller = CardSwiperController();
  List<GameCard> cards = []; // cards 변수를 초기화
  final random = Random();
  bool _isAnswered = false;
  List<GameContents> randomChurchCaptain = [];
  @override
  void initState() {
    super.initState();
    focusNode.requestFocus();

    // widget.id 값에 따라 cards 변수에 값을 할당

    final churchCaptainIndices =
        List<int>.generate(churchCaptain.length, (i) => i)..shuffle(random);
    randomChurchCaptain = churchCaptainIndices
        .sublist(0, 10)
        .map((index) => churchCaptain[index])
        .toList();

    cards = randomChurchCaptain
        .map((gameContents) =>
            GameCard(gameContents: gameContents, fontSize: 70))
        .toList();
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
    return Scaffold(
      backgroundColor: const Color.fromRGBO(14, 25, 62, 1),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background_church.png"),
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
                              builder: (context) => const GameOverChurch(
                                gameName: 'churchCaptain',
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
                            color: Colors.black,
                            icon: const ImageIcon(
                                AssetImage('assets/images/Exit.png')),
                            iconSize: 39,
                          ),
                          const Spacer(),
                          Text(
                            '${currentCardIndex + 1}/${cards.length}',
                            style: const TextStyle(
                              fontFamily: 'DungGeunMo',
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 36,
                            ),
                          ),
                          const Spacer(),
                          const SizedBox(width: 50),
                        ],
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            isUndoButtonVisible
                                ? IconButton(
                                    onPressed: () {
                                      controller.undo();
                                      _isAnswered = false;
                                    },
                                    color: Colors.transparent,
                                    icon: ImageIcon(
                                      const AssetImage(
                                          'assets/images/icon_chevron_left.png'),
                                      color: Colors.black.withOpacity(0.4),
                                    ),
                                    iconSize: 90,
                                  )
                                : IconButton(
                                    onPressed: () {
                                      controller.undo();
                                      _isAnswered = false;
                                      if (currentCardIndex == 0) {
                                        setState(() {
                                          isUndoButtonVisible = true;
                                        });
                                      }
                                    },
                                    color: Colors.transparent,
                                    icon: const ImageIcon(
                                      AssetImage(
                                          'assets/images/icon_chevron_left_white.png'),
                                      color: Colors.black,
                                    ),
                                    iconSize: 90,
                                  ),
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
                                  return _isAnswered
                                      ? cards[index]
                                      : const Center(
                                          child: Text(
                                            '버튼을 눌러서\n문제를 확인해보세요!',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontFamily: 'DungGeunMo',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 84,
                                                color: Colors.black),
                                          ),
                                        );
                                },
                                isDisabled: true,
                                onSwipe: _onSwipe,
                                onUndo: _onUndo,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                if (currentCardIndex == 9) {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => const GameOverChurch(
                                        gameName: 'churchCaptain',
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
                              color: Colors.transparent,
                              icon: const ImageIcon(
                                AssetImage(
                                    'assets/images/icon_chevron_right.png'),
                                color: Colors.black,
                              ),
                              iconSize: 90,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 250,
                        height: 71,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _isAnswered = !_isAnswered;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _isAnswered
                                ? Colors.white
                                : const Color(0xffFFF27F),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          child: Text(
                            !_isAnswered ? '문제보기' : '가리기',
                            style: const TextStyle(
                              fontFamily: 'DungGeunMo',
                              fontWeight: FontWeight.w400,
                              fontSize: 42,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 110),
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
