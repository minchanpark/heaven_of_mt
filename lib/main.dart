// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:testes/brand/SetPage_brand.dart';
import 'choi/Gamepage_choi.dart';
import 'choi/SetPage_choi.dart';
import 'four/SetPage_four.dart';
import 'gameover.dart';

void main() {
  runApp(
    const MaterialApp(debugShowCheckedModeBanner: false, home: MyHome()),
  );
}

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/gif.gif'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Center(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(height: height * 0.15),
            ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      colors: <Color>[
                        Color.fromRGBO(255, 0, 142, 1),
                        Color.fromRGBO(255, 235, 90, 1)
                      ],
                      begin: Alignment.topCenter, // 그라데이션 시작 위치 (위쪽 중앙)
                      end: Alignment.bottomCenter, // 그라데이션 끝 위치 (아래쪽 중앙)
                    ).createShader(bounds);
                  },
                  child: Text(
                    '서비스 이름',
                    style: TextStyle(
                      fontFamily: 'Pretendard',
                      color: Colors.white,
                      fontSize: 96,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
            SizedBox(height: height * 0.13),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(5, (index) {
                return Column(
                  children: [
                    GameList(index: "${index + 1}", name: gameName[index]),
                    SizedBox(height: height * 0.01)
                  ],
                );
              }),
            ),
          ]),
        ),
      ]),
    );
  }
}

class CustomImageWidget extends StatefulWidget {
  final String imagePath;

  const CustomImageWidget({required this.imagePath, Key? key})
      : super(key: key);

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
            duration: Duration(milliseconds: 400), // 애니메이션 지속 시간 조절
            decoration: BoxDecoration(
              color: _backgroundColor, // 배경색을 지정합니다.
              borderRadius: BorderRadius.circular(20.0), // 원하는 반지름 값으로 조절
            ),
            width: 240,
            height: 500,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0), // 위와 같은 반지름 값으로 조절
              child: Image.asset(
                widget.imagePath,
                fit: BoxFit.cover,
                color: Colors.black.withOpacity(_opacity), // 이미지에 색상 필터를 적용합니다.
                colorBlendMode: BlendMode.srcOver,
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 300), // 애니메이션 지속 시간 조절
              opacity: _opacity == 0 ? 1.0 : 0.0,
              child: ElevatedButton(
                  onPressed: () {
                    switch (widget.index) {
                      case '1':
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ChoiPage()));
                        break;
                      case '2':
                        break;
                      case '3':
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => FourPage()));
                        break;
                      case '4':
                        break;
                      case '5':
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => BrandPage()));
                        break;
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    disabledBackgroundColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                  ),
                  child: Container(
                    width: 100,
                    height: 45,
                    child: Center(
                      child: Text(
                        '시작하기',
                        style: TextStyle(
                          fontFamily: 'Pretendard',
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
