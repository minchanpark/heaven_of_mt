import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'dart:math';
import '../game_contents.dart';
import '../gameover/gameover_web.dart';

class PersonWebGame extends StatefulWidget {
  const PersonWebGame({super.key});

  @override
  State<PersonWebGame> createState() => _PersonWebGameState();
}

class _PersonWebGameState extends State<PersonWebGame> {
  int currentCardIndex = 0; // 현재 카드의 인덱스를 저장할 변수
  final CardSwiperController controller = CardSwiperController();

  List<String> cards = []; // cards 변수를 초기화
  bool _isAnswered = false;
  String personName = '';
  final random = Random();
  @override
  void initState() {
    super.initState();

    final personIndices = List<int>.generate(person.length, (i) => i)
      ..shuffle(random);
    final randomPerson =
        personIndices.sublist(0, 10).map((index) => person[index]).toList();

    cards = randomPerson.map((gameContents) => gameContents.name).toList();
  }

  bool isUndoButtonVisible = true;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  String extractName(String imagePath) {
    List<String> pathParts = imagePath.split('/');
    List<String> fileParts = pathParts[2].split('.');
    String name = fileParts[0];
    return name;
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
                image: AssetImage("assets/images/background_game.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Container(
              padding: EdgeInsets.only(
                left: width * 0.075,
                top: height * 0.071,
                right: width * 0.075,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                          fontSize: 42,
                        ),
                      ),
                      const Spacer(),
                      const SizedBox(width: 50),
                    ],
                  ),
                  Row(
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
                        width: width * 0.57, // 최대 가로 크기를 설정할 수도 있습니다.
                        height: height * 0.67, // 최대 세로 크기를 설정할 수도 있습니다
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
                            personName = extractName(cards[index]);
                            return Image.asset(
                              cards[index],
                              fit: BoxFit.fitHeight,
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
                                builder: (context) => const GameOver(
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
                          _isAnswered = false;
                        },
                        color: Colors.transparent,
                        icon: const ImageIcon(
                          AssetImage('assets/images/icon_chevron_right.png'),
                        ),
                        iconSize: 90,
                      ),
                    ],
                  ),
                  // SizedBox(height: height * 0.038),
                  !_isAnswered
                      ? SizedBox(
                          width: 250,
                          height: 71,
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _isAnswered = !_isAnswered;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xffFF62D3),
                                  textStyle: const TextStyle(
                                      fontFamily: 'DungGeunMo',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 42,
                                      color: Colors.black),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12))),
                              child: const Text('정답보기')),
                        )
                      : Text(personName,
                          style: const TextStyle(
                              fontFamily: 'DungGeunMo',
                              fontWeight: FontWeight.w400,
                              fontSize: 72,
                              color: Color(0xffFF62D3))),
                ],
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
