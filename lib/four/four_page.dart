import 'package:flutter/material.dart';

import 'set_four.dart';
import 'set_four_app.dart';

class FourPage extends StatefulWidget {
  const FourPage({super.key});

  @override
  State<FourPage> createState() => _FourPageState();
}

class _FourPageState extends State<FourPage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    if(width > 500) {
      return const FourWeb();
    }
    else {
      return const FourApp();
    }
  }
}