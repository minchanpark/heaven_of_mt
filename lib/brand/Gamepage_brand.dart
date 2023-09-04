// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

import '../gameover.dart';
import '../candidate_choi.dart';
import '../card.dart';

class BrandGame extends StatefulWidget {
  final String id;

  const BrandGame({
    super.key,
    required this.id,
    
  });

  @override
  State<BrandGame> createState() => _BrandGameState();
}

class _BrandGameState extends State<BrandGame> {
  int currentCardIndex = 0; // 현재 카드의 인덱스를 저장할 변수
  final CardSwiperController controller = CardSwiperController();
  List<GameCard> cards = []; // cards 변수를 초기화
  String setNumber = '';
  @override
  void initState() {
    super.initState();

    // widget.id 값에 따라 cards 변수에 값을 할당
    if (widget.id == '1') {
      cards = candidates1.map(GameCard.new).toList();
    } else if (widget.id == '2') {
      cards = candidates2.map(GameCard.new).toList();
    } else if (widget.id == '3') {
      cards = candidates3.map(GameCard.new).toList();
    } else if (widget.id == '4') {
      cards = candidates4.map(GameCard.new).toList();
    } else if (widget.id == '5') {
      cards = candidates5.map(GameCard.new).toList();
    } else {
      cards = candidates5.map(GameCard.new).toList();
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
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Color.fromRGBO(14, 25, 62, 1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 50),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 90),
                  IconButton(
                    onPressed: () {},
                    color: Colors.white,
                    icon: ImageIcon(
                      AssetImage('assets/images/Exit.png'),
                    ),
                    iconSize: 90,
                  ),
                  SizedBox(height: 155),
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
                ],
              ),
              Container(
                width: 1128,
                height: 832,
                margin: EdgeInsets.only(top: 113),
                child: Column(
                  children: [
                    Text(
                      'SET $setNumber',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 60,
                      ),
                    ),
                    Flexible(
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
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  print(currentCardIndex);
                  if (currentCardIndex == 9) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            GameOver(id: widget.id), // 새로운 페이지 위젯을 여기에 추가
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
              SizedBox(width: 50),
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
