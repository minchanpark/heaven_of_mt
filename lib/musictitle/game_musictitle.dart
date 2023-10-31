import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'dart:math';

import '../game_contents.dart';
import '../card/card.dart';
import '../gameover/gameover_web.dart';

class MusicTitleWebGame extends StatefulWidget {
  final String generation;
  const MusicTitleWebGame({super.key, required this.generation});

  @override
  State<MusicTitleWebGame> createState() => _MusicTitleWebGamePageState();
}

class _MusicTitleWebGamePageState extends State<MusicTitleWebGame> {
  FocusNode focusNode = FocusNode();
  int currentCardIndex = 0; // 현재 카드의 인덱스를 저장할 변수
  final CardSwiperController controller = CardSwiperController();
  List<GameCard> cards = []; // cards 변수를 초기화
  List<GameCard> answer_cards = [];
  final random = Random();
  bool _isAnswered = false;
  List<GameContents> randomMusicTitle = [];
  @override
  void initState() {
    super.initState();
    focusNode.requestFocus();

    // widget.id 값에 따라 cards 변수에 값을 할당

    if (widget.generation == '1990') {
      final musicTitleIndices = List<int>.generate(music1990.length, (i) => i)
        ..shuffle(random);
      randomMusicTitle = musicTitleIndices
          .sublist(0, 10)
          .map((index) => music1990[index])
          .toList();

      cards = randomMusicTitle
          .map((gameContents) =>
              GameCard(gameContents: gameContents, fontSize: 108))
          .toList();
      answer_cards = randomMusicTitle
          .map((gameContents) =>
              GameCard(gameContents: gameContents, answer: true, fontSize: 108))
          .toList();
    } else if (widget.generation == '2000') {
      final musicTitleIndices = List<int>.generate(music2000.length, (i) => i)
        ..shuffle(random);
      randomMusicTitle = musicTitleIndices
          .sublist(0, 10)
          .map((index) => music2000[index])
          .toList();

      cards = randomMusicTitle
          .map((gameContents) =>
              GameCard(gameContents: gameContents, fontSize: 108))
          .toList();
    } else if (widget.generation == '2010') {
      final musicTitleIndices = List<int>.generate(music2010.length, (i) => i)
        ..shuffle(random);
      randomMusicTitle = musicTitleIndices
          .sublist(0, 10)
          .map((index) => music2010[index])
          .toList();

      cards = randomMusicTitle
          .map((gameContents) =>
              GameCard(gameContents: gameContents, fontSize: 108))
          .toList();
    } else if (widget.generation == '2020') {
      final musicTitleIndices = List<int>.generate(music2020.length, (i) => i)
        ..shuffle(random);
      randomMusicTitle = musicTitleIndices
          .sublist(0, 10)
          .map((index) => music2020[index])
          .toList();

      cards = randomMusicTitle
          .map((gameContents) =>
              GameCard(gameContents: gameContents, fontSize: 108))
          .toList();
    }
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
                image: AssetImage("assets/images/background_final.png"),
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
                                gameName: 'musictitle',
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
                    // crossAxisAlignment: CrossAxisAlignment.center,
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
                            iconSize: 39,
                          ),
                          const Spacer(),
                          Text(
                            '${currentCardIndex + 1}/${cards.length}',
                            style: const TextStyle(
                              fontFamily: 'DungGeunMo',
                              color: Colors.white,
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
                                    icon: const ImageIcon(
                                      AssetImage(
                                          'assets/images/icon_chevron_left.png'),
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
                                    ),
                                    iconSize: 90,
                                  ),
                            SizedBox(
                              width: width * 0.63,
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
                            IconButton(
                              onPressed: () {
                                if (currentCardIndex == 9) {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => const GameOver(
                                        gameName: 'musicTitle',
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
                                : const Color(0xffFF62D3),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          child: Text(
                            _isAnswered ? '문제보기' : '정답보기',
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
