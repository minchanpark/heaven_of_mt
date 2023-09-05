import 'package:flutter/material.dart';
import 'package:testes/main.dart';

class GameOver extends StatefulWidget {
  final String id;
  const GameOver({super.key, required this.id});

  @override
  State<GameOver> createState() => _GameOverState();
}

class _GameOverState extends State<GameOver> {
  String setNumber = '';
  @override
  void initState() {
    super.initState();
    setNumber = widget.id;
  }

  bool isMouseOver = false;
  bool isMouseOver1 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        color: const Color.fromRGBO(14, 25, 62, 1),
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 106),
            Text(
              setNumber,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 48,
              ),
            ),
            const Text(
              '모든 문제를 완료했어요!',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 48,
              ),
            ),
            const SizedBox(height: 195),
            MouseRegion(
              cursor: SystemMouseCursors.click, // 마우스 커서를 클릭 스타일로 설정
              onEnter: (_) {
                setState(() {
                  isMouseOver = true;
                });
              },
              onExit: (_) {
                setState(() {
                  isMouseOver = false;
                });
              },
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isMouseOver
                      ? Colors.transparent // 마우스를 올렸을 때 배경 색상을 투명하게 설정
                      : const Color.fromRGBO(14, 25, 62, 1), // 기본 배경 색상

                  disabledBackgroundColor: const Color.fromRGBO(14, 25, 62, 1),
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Play Again',
                  style: TextStyle(
                    color: isMouseOver
                        ? const Color.fromRGBO(255, 98, 211, 1)
                        : Colors.white, // 텍스트 색상 변경
                    fontWeight: isMouseOver
                        ? FontWeight.bold
                        : FontWeight.normal, // 텍스트 두께 변경
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            MouseRegion(
              cursor: SystemMouseCursors.click, // 마우스 커서를 클릭 스타일로 설정
              onEnter: (_) {
                setState(() {
                  isMouseOver1 = true;
                });
              },
              onExit: (_) {
                setState(() {
                  isMouseOver1 = false;
                });
              },
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isMouseOver1
                      ? Colors.transparent // 마우스를 올렸을 때 배경 색상을 투명하게 설정
                      : const Color.fromRGBO(14, 25, 62, 1), // 기본 배경 색상

                  disabledBackgroundColor: const Color.fromRGBO(14, 25, 62, 1),
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          const MyHome(), // Beauty 이미지에 대한 페이지
                    ),
                  );
                },
                child: Text(
                  'Go Home',
                  style: TextStyle(
                    color:
                        isMouseOver1 ? Colors.pink : Colors.white, // 텍스트 색상 변경
                    fontWeight: isMouseOver1
                        ? FontWeight.bold
                        : FontWeight.normal, // 텍스트 두께 변경
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
