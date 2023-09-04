// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import 'Gamepage_choi.dart';

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
        margin: EdgeInsets.all(80),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '초성게임',
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    color: Colors.white,
                    fontSize: 100,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomImageWidget(number: 'SET1'),
                    CustomImageWidget(number: 'SET2'),
                    CustomImageWidget(number: 'SET3'),
                    CustomImageWidget(number: 'SET4'),
                    CustomImageWidget(number: 'SET5'),
                  ],
                ),
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
  final Color _backgroundColor = Colors.white;
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
            margin: EdgeInsets.only(left: 60),
            duration: Duration(milliseconds: 300), // 애니메이션 지속 시간 조절
            decoration: BoxDecoration(
              color: Colors.transparent, // 배경색을 지정합니다.
              borderRadius: BorderRadius.circular(20.0), // 원하는 반지름 값으로 조절
            ),
            width: 120,
            height: 48,
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
              duration: Duration(milliseconds: 300), // 애니메이션 지속 시간 조절
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
                    backgroundColor: Colors.white,
                    disabledBackgroundColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                  ),
                  child:
                      Center(child: Image.asset('assets/images/pink_up.png'))),
            ),
          ),
        ],
      ),
    );
  }
}
