import 'package:flutter/material.dart';
import 'package:testes/choi/set_choi.dart';
import 'package:testes/choi/set_choi_app.dart';

class ChoiPage extends StatefulWidget {
  const ChoiPage({super.key});

  @override
  State<ChoiPage> createState() => _ChoiPageState();
}

class _ChoiPageState extends State<ChoiPage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    if(width > 400) {
      return const ChoiWeb();
    }
    else {
      return const ChoiApp();
    }
    
  }
}