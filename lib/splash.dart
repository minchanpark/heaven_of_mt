import 'dart:async';

import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({
    super.key,
  });
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool _isVisible = true;
  @override
  void initState() {
    super.initState();

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
          Row(
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
                    child: const Text(
                      "Game Start",
                      style: TextStyle(
                          fontFamily: 'DungGeunMo',
                          fontWeight: FontWeight.w400,
                          fontSize: 72,
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
          )
        ]),
      ]),
    );
  }
}
