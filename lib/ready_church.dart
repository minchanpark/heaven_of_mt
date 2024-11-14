import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ReadyChurchPage extends StatefulWidget {
  const ReadyChurchPage({
    super.key,
  });
  @override
  State<ReadyChurchPage> createState() => _ReadyChurchPageState();
}

class _ReadyChurchPageState extends State<ReadyChurchPage> {
  @override
  void initState() {
    super.initState();

    FirebaseAnalytics.instance.logScreenView(screenName: "교회_준비중페이지");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background_church.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Image.asset("assets/images/ready_church.png"),
        ),
      ),
    );
  }
}
