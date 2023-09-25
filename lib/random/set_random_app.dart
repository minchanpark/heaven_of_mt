import 'package:flutter/material.dart';
import 'random_game_page.dart';

class RandomApp extends StatefulWidget {
  const RandomApp({super.key});

  @override
  State<RandomApp> createState() => _RandomAppState();
}

class _RandomAppState extends State<RandomApp> {
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
                image: AssetImage('assets/images/home.gif'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.only(
                  left: width * 0.06, top: height * 0.1, right: width * 0.06),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.popUntil(
                              context, ModalRoute.withName('/home'));
                        },
                        color: Colors.white,
                        icon: const ImageIcon(AssetImage(
                            'assets/images/icon_chevron_left_white.png')),
                        iconSize: 27,
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.0628),
                  Column(
                    children: [
                      ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return const LinearGradient(
                            colors: <Color>[
                              Color.fromRGBO(255, 0, 142, 1),
                              Color.fromRGBO(255, 235, 90, 1)
                            ],
                            begin: Alignment.topCenter, // 그라데이션 시작 위치 (위쪽 중앙)
                            end: Alignment.bottomCenter, // 그라데이션 끝 위치 (아래쪽 중앙)
                          ).createShader(bounds);
                        },
                        child: const Text(
                          '랜덤게임',
                          style: TextStyle(
                            fontFamily: 'DungGeunMo',
                            color: Colors.white,
                            fontSize: 45,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.032),
                      TextButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              overlayColor: MaterialStateProperty.all(
                                  Colors.transparent)),
                          child: RichText(
                            text: const TextSpan(
                                text: "설명보기",
                                style: TextStyle(
                                    fontFamily: 'DungGeunMo',
                                    fontSize: 23,
                                    color: Colors.white,
                                    decoration: TextDecoration.underline)),
                          )),
                    ],
                  ),
                  SizedBox(height: height * 0.09),
                  Column(
                      children: List.generate(5, (index) {
                    return Column(
                      children: [
                        CustomImageWidget(number: 'SET ${index + 1}'),
                        SizedBox(height: height * 0.022)
                      ],
                    );
                  })),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomImageWidget extends StatefulWidget {
  final String number;

  const CustomImageWidget({required this.number, Key? key}) : super(key: key);

  @override
  State<CustomImageWidget> createState() => _CustomImageWidgetState();
}

class _CustomImageWidgetState extends State<CustomImageWidget> {
  double _opacity = 0.5;
  bool _isMouseOver = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isMouseOver = true;
          _opacity = 0.0;
        });
      },
      onExit: (_) {
        setState(() {
          _isMouseOver = false;
          _opacity = 0.5;
        });
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300), // 애니메이션 지속 시간 조절
            decoration: BoxDecoration(
              color: Colors.transparent, // 배경색을 지정합니다.
              borderRadius: BorderRadius.circular(20.0), // 원하는 반지름 값으로 조절
            ),
            width: 120,
            height: 50,
            child: Center(
              child: Text(
                widget.number,
                style: const TextStyle(
                  fontFamily: 'DungGeunMo',
                  color: Colors.white,
                  fontSize: 45,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 3,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 0), // 애니메이션 지속 시간 조절
              opacity: _opacity == 0 ? 1.0 : 0.0,
              child: ElevatedButton(
                  onPressed: () {
                    _showDeleteConfirmationDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    disabledBackgroundColor: Colors.transparent,
                    foregroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        width: 25,
                        height: 31,
                        child: ImageIcon(
                          AssetImage('assets/images/pink_up.png'), // 이미지 파일 경로
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        color: const Color.fromRGBO(255, 98, 211, 1),
                        child: Text(
                          widget.number,
                          style: const TextStyle(
                            fontFamily: 'DungGeunMo',
                            color: Colors.white,
                            fontSize: 48,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const SizedBox(
                        width: 25,
                        height: 31,
                        child: ImageIcon(
                          AssetImage(
                              'assets/images/pink_down.png'), // 이미지 파일 경로
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
  String _getImagePath(String id) {
    switch (id) {
      case 'SET 1':
        return 'assets/images/modal_choi_app.png';
      case 'SET 2':
        return 'assets/images/modal_person_app.png';
      case 'SET 3':
        return 'assets/images/modal_four_app.png';
      case 'SET 4':
        return 'assets/images/modal_tele_app.png';
      default:
        return 'assets/images/modal_brand_app.png';
    }
  }

  void _showDeleteConfirmationDialog(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shadowColor: Colors.transparent,
          contentPadding: const EdgeInsets.all(0), // padding을 0으로 설정
          insetPadding: const EdgeInsets.all(16), // 화면 주변 padding 설정
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          content: InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => RandomGamePage(id: widget.number),
                )
              );
            },
            child: SizedBox(
                width: width * 0.87, // 원하는 가로 길이 설정
                height: height * 0.679, // 원하는 세로 길이 설정
                child: Center(
                  child: Image.asset(
                    _getImagePath(widget.number),
                    fit: BoxFit.cover,
                  ),
                )),
          ),
        );
      },
    );
  }
}
