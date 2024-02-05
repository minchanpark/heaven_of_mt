import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ready.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({
    super.key,
  });
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool _isVisible = true;
  FocusNode focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    focusNode.requestFocus();
    FirebaseAnalytics.instance.setCurrentScreen(screenName: "스플래쉬");

    // Start a timer to toggle visibility every 1 second
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _isVisible = !_isVisible;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    if (width < 1126 || height < 627) return ReadyPage();
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/home.gif'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(height: height * 0.18),
          Container(
              margin:
                  EdgeInsets.only(left: width * 0.125, right: width * 0.125),
              child: Image.asset('assets/images/title.png',
                  width: width * 0.75, height: height * 0.19)),
          SizedBox(height: height * 0.35),
          RawKeyboardListener(
            focusNode: focusNode,
            onKey: (RawKeyEvent event) {
              if (event is RawKeyDownEvent) {
                if (event.logicalKey == LogicalKeyboardKey.enter ||
                    event.logicalKey == LogicalKeyboardKey.space) {
                  Navigator.pushNamed(context, '/home');
                }
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedOpacity(
                  opacity: _isVisible ? 1.0 : 0.1,
                  duration: const Duration(seconds: 1), // Animation duration
                  child: Image.asset(
                    "assets/images/splash_left.png",
                    width: 22,
                    height: 38.5,
                  ),
                ),
                SizedBox(width: width * 0.026),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  child: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return const LinearGradient(
                        colors: [Color(0xFFFEE100), Color(0xFFFF008E)],
                        stops: [0.276, 0.9844],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ).createShader(bounds);
                    },
                    child: AnimatedOpacity(
                      opacity: _isVisible ? 1.0 : 0.1,
                      duration: const Duration(seconds: 1),
                      child: Text(
                        "Game Start",
                        style: TextStyle(
                            fontFamily: 'DungGeunMo',
                            fontWeight: FontWeight.w400,
                            fontSize: width * 0.056,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: width * 0.026),
                AnimatedOpacity(
                  opacity: _isVisible ? 1.0 : 0.1,
                  duration: const Duration(seconds: 1), // Animation duration
                  child: Image.asset(
                    "assets/images/splash_right.png",
                    width: 22,
                    height: 38.5,
                  ),
                ),
              ],
            ),
          )
        ]),
      ]),
    );
  }
}
