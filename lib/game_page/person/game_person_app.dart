import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'dart:math';
import '../../game_contents.dart';
import '../../gameover/gameover_app.dart';
import '../../image_card.dart';

class PersonAppGame extends StatefulWidget {
  const PersonAppGame({super.key});

  @override
  State<PersonAppGame> createState() => _PersonAppGameState();
}

class _PersonAppGameState extends State<PersonAppGame> {
  int currentCardIndex = 0; // 현재 카드의 인덱스를 저장할 변수
  final CardSwiperController controller = CardSwiperController();
  List<ImageGameCard> cards = []; // cards 변수를 초기화
  String setNumber = '';
  final random = Random();
  @override
  void initState() {
    super.initState();

    final personIndices = List<int>.generate(person.length, (i) => i)
      ..shuffle(random);
    final randomPerson =
        personIndices.sublist(0, 10).map((index) => person[index]).toList();

    cards = randomPerson
        .map((gameContents) => ImageGameCard(gameContents: gameContents))
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
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 29, top: 62, right: 29),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    color: Colors.white,
                    icon: const ImageIcon(AssetImage('assets/images/Exit.png')),
                    iconSize: 27,
                  ),
                ],
              ),
              Text(
                setNumber,
                style: const TextStyle(
                  fontFamily: 'DungGeunMo',
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 34,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                '${currentCardIndex + 1} / ${cards.length}',
                style: const TextStyle(
                  fontFamily: 'DungGeunMo',
                  color: Color.fromRGBO(255, 98, 211, 1),
                  fontWeight: FontWeight.w400,
                  fontSize: 26,
                ),
              ),
              SizedBox(height: height * 0.1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  isUndoButtonVisible
                      ? ConstrainedBox(
                          constraints: const BoxConstraints.tightFor(
                              width: 29, height: 52),
                          child: ElevatedButton(
                            onPressed: () {
                              controller.undo;
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              padding: const EdgeInsets.only(left: 0),
                            ),
                            child: const ImageIcon(
                              AssetImage('assets/images/icon_chevron_left.png'),
                              size: 90,
                            ),
                          ),
                        )
                      : ConstrainedBox(
                          constraints: const BoxConstraints.tightFor(
                              width: 29, height: 52),
                          child: ElevatedButton(
                            onPressed: () {
                              controller.undo();
                              if (currentCardIndex == 0) {
                                setState(() {
                                  isUndoButtonVisible = true;
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              padding: const EdgeInsets.only(left: 0),
                            ),
                            child: const ImageIcon(
                              AssetImage(
                                  'assets/images/icon_chevron_left_white.png'),
                              size: 90,
                            ),
                          ),
                        ),
                  SizedBox(
                    width: width * 0.7, // 최대 가로 크기를 설정할 수도 있습니다.
                    height: height * 0.4, // 최대 세로 크기를 설정할 수도 있습니다
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
                        return cards[index];
                      },
                      isDisabled: true,
                      onSwipe: _onSwipe,
                      onUndo: _onUndo,
                    ),
                  ),
                  ConstrainedBox(
                    constraints:
                        const BoxConstraints.tightFor(width: 29, height: 52),
                    child: ElevatedButton(
                      onPressed: () {
                        if (currentCardIndex == 9) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const GameOverApp(
                                gameName: 'person',
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
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        padding: EdgeInsets.zero,
                      ),
                      child: const ImageIcon(
                        AssetImage('assets/images/icon_chevron_right.png'),
                        size: 90,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
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
