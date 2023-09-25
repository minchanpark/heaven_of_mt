import 'package:flutter/material.dart';
import 'set_tele.dart';
import 'set_tele_app.dart';

class TelePage extends StatefulWidget {
  const TelePage({super.key});

  @override
  State<TelePage> createState() => _TelePageState();
}

class _TelePageState extends State<TelePage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    if(width > 500) {
      return const TeleWeb();
    }
    else {
      return const TeleApp();
    }
    
  }
}