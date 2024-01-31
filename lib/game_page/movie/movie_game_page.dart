import 'package:flutter/material.dart';
import 'game_movie.dart';

class MovieGamePage extends StatefulWidget {
  const MovieGamePage({
    super.key,
  });

  @override
  State<MovieGamePage> createState() => _MovieGamePageState();
}

class _MovieGamePageState extends State<MovieGamePage> {
  @override
  Widget build(BuildContext context) {
    
    return const MovieWebGame();
  }
}
