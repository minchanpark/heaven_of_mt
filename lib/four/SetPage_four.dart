// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import 'Gamepage_four.dart';

class fourPage extends StatefulWidget {
  const fourPage({Key? key}) : super(key: key);

  @override
  State<fourPage> createState() => _fourPageState();
}

class _fourPageState extends State<fourPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(14, 25, 62, 1),
      body: Container(
        margin: EdgeInsets.only(left: 131),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '네 ',
              style: TextStyle(
                fontFamily: 'Pretendard',
                color: Colors.white,
                fontSize: 100,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 50),
            Row(
              children: [
                CustomImageWidget(number: 'SET 1'),
                SizedBox(width: 108),
                CustomImageWidget(number: 'SET 2'),
                SizedBox(width: 108),
                CustomImageWidget(number: 'SET 3'),
                SizedBox(width: 108),
                CustomImageWidget(number: 'SET 4'),
                SizedBox(width: 108),
                CustomImageWidget(number: 'SET 5'),
              ],
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
              color: Colors.transparent,
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
                            fourGame(id: widget.number), // Beauty 이미지에 대한 페이지
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
