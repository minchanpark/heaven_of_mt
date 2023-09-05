// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:testes/brand/SetPage_brand.dart';
import 'choi/SetPage_choi.dart';
import 'four/SetPage_four.dart';

void main() {
  runApp(
    const MaterialApp(debugShowCheckedModeBanner: false, home: BrandPage()),
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
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomImageWidget(imagePath: 'assets/images/PC.png'),
            CustomImageWidget(imagePath: 'assets/images/Beauty.jpeg'),
            CustomImageWidget(imagePath: 'assets/images/Peace.jpeg'),
            CustomImageWidget(imagePath: 'assets/images/SW.jpeg'),
            CustomImageWidget(imagePath: 'assets/images/Paris.jpeg'),
          ],
        ),
      ),
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
                    if (widget.imagePath == 'assets/images/PC.png') {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ChoiPage(), // PC 이미지에 대한 페이지
                        ),
                      );
                    } else if (widget.imagePath ==
                        'assets/images/Beauty.jpeg') {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => BrandPage(), // PC 이미지에 대한 페이지
                        ),
                      );
                    } else if (widget.imagePath == 'assets/images/Peace.jpeg') {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => FourPage(), // PC 이미지에 대한 페이지
                        ),
                      );
                    } else if (widget.imagePath == 'assets/images/SW.jpeg') {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => BrandPage(), // PC 이미지에 대한 페이지
                        ),
                      );
                    } else {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => BrandPage(), // PC 이미지에 대한 페이지
                        ),
                      );
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
