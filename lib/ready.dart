import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ReadyPage extends StatefulWidget {
  const ReadyPage({
    super.key,
  });
  @override
  State<ReadyPage> createState() => _ReadyPageState();
}

class _ReadyPageState extends State<ReadyPage> {
  @override
  void initState() {
    super.initState();

    FirebaseAnalytics.instance.logScreenView(screenName: "준비중페이지");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/home.gif'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Image.asset("assets/images/ready.png"),
        ),
      ),
    );
  }
}
