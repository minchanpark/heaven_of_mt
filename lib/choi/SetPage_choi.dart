// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import 'Gamepage_choi.dart';

class ChoiPage extends StatefulWidget {
  const ChoiPage({Key? key}) : super(key: key);

  @override
  State<ChoiPage> createState() => _ChoiPageState();
}

class _ChoiPageState extends State<ChoiPage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromRGBO(14, 25, 62, 1),
      body: Container(
        padding: EdgeInsets.only(
            left: width * 0.075, top: height * 0.073, right: width * 0.11),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              color: Colors.white,
              icon: ImageIcon(AssetImage('assets/images/home.png')),
              iconSize: 39,
            ),
            SizedBox(height: height * 0.1),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  '초성 퀴즈',
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    color: Colors.white,
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: width * 0.015),
                TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent)),
                    child: RichText(
                      text: TextSpan(
                          text: "설명보기",
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              decoration: TextDecoration.underline)),
                    )),
              ],
            ),
            SizedBox(height: 50),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomImageWidget(number: 'SET 1'),
                  CustomImageWidget(number: 'SET 2'),
                  CustomImageWidget(number: 'SET 3'),
                  CustomImageWidget(number: 'SET 4'),
                  CustomImageWidget(number: 'SET 5'),
                ],
              ),
            ),
          ],
        ),
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
            duration: Duration(milliseconds: 300), // 애니메이션 지속 시간 조절
            decoration: BoxDecoration(
              color: Colors.transparent, // 배경색을 지정합니다.
              borderRadius: BorderRadius.circular(20.0), // 원하는 반지름 값으로 조절
            ),
            width: 136,
            height: 133,
            child: Center(
              child: Text(
                widget.number,
                style: TextStyle(
                  fontFamily: 'Pretendard',
                  color: Colors.white,
                  fontSize: 48,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 0), // 애니메이션 지속 시간 조절
              opacity: _opacity == 0 ? 1.0 : 0.0,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            ChoiGame(id: widget.number), // Beauty 이미지에 대한 페이지
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color.fromRGBO(14, 25, 62, 1), // 기본 배경 색상
                    disabledBackgroundColor:
                        const Color.fromRGBO(14, 25, 62, 1), // 기본 배경 색상
                    foregroundColor:
                        const Color.fromRGBO(14, 25, 62, 1), // 기본 배경 색상
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                          width: 25,
                          height: 31,
                          child: Image.asset('assets/images/pink_up.png')),
                      SizedBox(height: 8),
                      Container(
                        color: Color.fromRGBO(255, 98, 211, 1),
                        child: Text(
                          widget.number,
                          style: TextStyle(
                            fontFamily: 'Pretendard',
                            color: Colors.white,
                            fontSize: 48,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      SizedBox(
                          width: 25,
                          height: 31,
                          child: Image.asset('assets/images/pink_down.png')),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
