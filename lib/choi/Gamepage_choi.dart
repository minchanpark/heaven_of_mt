// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

import '../candidate_choi.dart';
import '../gameover.dart';
import '../card.dart';

class ChoiGame extends StatefulWidget {
  final String id;

  const ChoiGame({
    super.key,
    required this.id,
  });

  @override
  State<ChoiGame> createState() => _ChoiGamePageState();
}

class _ChoiGamePageState extends State<ChoiGame> {
  int currentCardIndex = 0; // 현재 카드의 인덱스를 저장할 변수
  final CardSwiperController controller = CardSwiperController();
  List<GameCard> cards = []; // cards 변수를 초기화
  String setNumber = '';
  @override
  void initState() {
    super.initState();

    // widget.id 값에 따라 cards 변수에 값을 할당
    if (widget.id == '1') {
      cards = candidates1
          .map((candidate) => GameCard(candidate: candidate))
          .toList();
    } else if (widget.id == '2') {
      cards = candidates2
          .map((candidate) => GameCard(candidate: candidate))
          .toList();
    } else if (widget.id == '3') {
      cards = candidates3
          .map((candidate) => GameCard(candidate: candidate))
          .toList();
    } else if (widget.id == '4') {
      cards = candidates4
          .map((candidate) => GameCard(candidate: candidate))
          .toList();
    } else {
      cards = candidates5
          .map((candidate) => GameCard(candidate: candidate))
          .toList();
    }
    setNumber = widget.id;
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
      appBar: AppBar(
        toolbarHeight: 100,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: Colors.white,
          icon: ImageIcon(
            AssetImage('assets/images/Exit.png'),
          ),
          iconSize: 90,
        ),
        backgroundColor: Color.fromRGBO(14, 25, 62, 1),
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
            color: Color.fromRGBO(14, 25, 62, 1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  setNumber,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 60,
                  ),
                ),
                SizedBox(height: height * 0.025),
                Text(
                  '${currentCardIndex + 1} / ${cards.length}',
                  style: const TextStyle(
                    color: Color.fromRGBO(255, 98, 211, 1),
                    fontWeight: FontWeight.w400,
                    fontSize: 36,
                  ),
                ),
                SizedBox(height: height * 0.1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    isUndoButtonVisible
                        ? IconButton(
                            onPressed: controller.undo,
                            color: Colors.transparent,
                            icon: ImageIcon(
                              AssetImage('assets/images/icon_chevron_left.png'),
                            ),
                            iconSize: 90, // 아이콘 크기 조절
                          )
                        : IconButton(
                            onPressed: () {
                              controller.undo();
                              if (currentCardIndex == 1) {
                                setState(() {
                                  isUndoButtonVisible = true; // undo 버튼을 숨김
                                });
                              }
                            },
                            color: Colors.transparent,
                            icon: ImageIcon(
                              AssetImage(
                                  'assets/images/icon_chevron_left_white.png'),
                            ),
                            iconSize: 90, // 아이콘 크기 조절
                          ),
                    SizedBox(
                      width: width * 0.77,
                      height: height * 0.45,
                      child: Flexible(
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
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        if (currentCardIndex == 9) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => GameOver(
                                id: widget.id,
                                gameName: 'choi',
                              ), // 새로운 페이지 위젯을 여기에 추가
                            ),
                          );
                        } else {
                          controller
                              .swipeLeft(); // 현재 카드의 인덱스가 10이 아니면 swipeLeft() 호출
                          if (currentCardIndex != 1) {
                            setState(() {
                              isUndoButtonVisible = false; // undo 버튼을 숨김
                            });
                          }
                        }
                      },
                      color: Colors.transparent,
                      icon: ImageIcon(
                        AssetImage('assets/images/icon_chevron_right.png'),
                      ),
                      iconSize: 90,
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }

  bool _onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $previousIndex was swiped to the ${direction.name}. Now the card $currentIndex is on top',
    );
    return true;
  }

  bool _onUndo(
    int? previousIndex,
    int currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $currentIndex was undod from the ${direction.name}',
    );
    return true;
  }
}
