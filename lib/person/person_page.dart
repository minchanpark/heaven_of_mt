import 'package:flutter/material.dart';

import 'set_person.dart';
import 'set_person_app.dart';

class PersonPage extends StatefulWidget {
  const PersonPage({super.key});

  @override
  State<PersonPage> createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    if(width > 500) {
      return const PersonWeb();
    }
    else {
      return const PersonApp();
    }
    
  }
}