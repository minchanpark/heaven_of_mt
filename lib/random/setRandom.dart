// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_field
import 'package:flutter/material.dart';
import 'gameRandom.dart';

class RandomPage extends StatefulWidget {
  const RandomPage({super.key});

  @override
  State<RandomPage> createState() => _RandomPageState();
}

class _RandomPageState extends State<RandomPage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromRGBO(14, 25, 62, 1),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/home.gif'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                left: width * 0.075, top: height * 0.073, right: width * 0.11),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.popUntil(context, ModalRoute.withName('/home'));
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
                        '랜덤게임',
                        style: TextStyle(
                          fontFamily: 'DungGeunMo',
                          color: Colors.white,
                          fontSize: 60,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
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
                  fontFamily: 'DungGeunMo',
                  color: Colors.white,
                  fontSize: 48,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 3,
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 0), // 애니메이션 지속 시간 조절
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
                            fontFamily: 'DungGeunMo',
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

  String _getImagePath(String id) {
    switch (id) {
      case 'SET 1':
        return 'assets/images/modal_choi.png';
      case 'SET 2':
        return 'assets/images/modal_person.png';
      case 'SET 3':
        return 'assets/images/modal_four.png';
      case 'SET 4':
        return 'assets/images/modal_tele.png';
      default:
        return 'assets/images/modal_brand.png';
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
          contentPadding: EdgeInsets.all(0), // padding을 0으로 설정
          insetPadding: EdgeInsets.all(16), // 화면 주변 padding 설정
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          content: Stack(
            children: [
              SizedBox(
                  width: width * 0.9, // 원하는 가로 길이 설정
                  height: height * 0.77, // 원하는 세로 길이 설정
                  child: Center(
                    child: Image.asset(
                      _getImagePath(widget.number),
                      fit: BoxFit.cover,
                    ),
                  )),
              Positioned(
                top: height * 0.05, // 상단으로부터의 거리를 화면 높이의 6%로 설정
                right: width * 0.11, // 오른쪽으로부터의 거리를 화면 너비의 22%로 설정
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            RandomGame(id: widget.number), // Beauty 이미지에 대한 페이지
                      ),
                    );
                  },
                  child: Container(
                    width: 40, // 버튼의 너비 설정
                    height: 40, // 버튼의 높이 설정
                    color: Colors.transparent, // 버튼의 배경색을 투명으로 만듭니다.
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
