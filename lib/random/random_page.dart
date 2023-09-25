import 'package:flutter/material.dart';

import 'set_random.dart';
import 'set_random_app.dart';

class RandomPage extends StatefulWidget {
  const RandomPage({super.key});

  @override
  State<RandomPage> createState() => _RandomPageState();
}

class _RandomPageState extends State<RandomPage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    if(width > 500) {
      return const RandomWeb();
    }
    else {
      return const RandomApp();
    }
    
  }
}