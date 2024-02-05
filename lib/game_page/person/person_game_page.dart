import 'package:flutter/material.dart';
import 'game_person.dart';
import 'game_person_app.dart';

class PersonGamePage extends StatefulWidget {
  const PersonGamePage({super.key});

  @override
  State<PersonGamePage> createState() => _PersonGamePageState();
}

class _PersonGamePageState extends State<PersonGamePage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return const PersonWebGame();
  }
}
