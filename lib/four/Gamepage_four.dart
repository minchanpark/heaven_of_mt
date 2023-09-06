// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

import '../gameover.dart';
import '../candidate_choi.dart';
import '../card.dart';

class FourGame extends StatefulWidget {
  final String id;

  const FourGame({
    super.key,
    required this.id,
  });

  @override
  State<FourGame> createState() => _FourGameState();
}

class _FourGameState extends State<FourGame> {
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
      backgroundColor: Color.fromRGBO(14, 25, 62, 1),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(
            left: width * 0.075,
            top: height * 0.073,
            right: width * 0.0797,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                    icon: ImageIcon(AssetImage('assets/images/Exit.png')),
                    iconSize: 39,
                  ),
                ],
              ),
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
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    isUndoButtonVisible
                        ? IconButton(
                            onPressed: controller.undo,
                            color: Colors.transparent,
                            icon: ImageIcon(
                              AssetImage('assets/images/icon_chevron_left.png'),
                            ),
                            iconSize: 90,
                          )
                        : IconButton(
                            onPressed: () {
                              controller.undo();
                              if (currentCardIndex == 1) {
                                setState(() {
                                  isUndoButtonVisible = true;
                                });
                              }
                            },
                            color: Colors.transparent,
                            icon: ImageIcon(
                              AssetImage(
                                  'assets/images/icon_chevron_left_white.png'),
                            ),
                            iconSize: 90,
                          ),
                    SizedBox(
                      width: width * 0.4,
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
                          return cards[index];
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
                              builder: (context) => GameOver(
                                id: widget.id,
                                gameName: 'four',
                              ),
                            ),
                          );
                        } else {
                          controller.swipeLeft();
                          if (currentCardIndex != 1) {
                            setState(() {
                              isUndoButtonVisible = false;
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