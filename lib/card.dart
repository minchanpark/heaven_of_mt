// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import 'choi/candidate_choi.dart';

class GameCard extends StatelessWidget {
  final ChoiCandidateModel candidate;

  const GameCard(
    this.candidate, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            '${candidate.index} / 10',
            style: const TextStyle(
              color: Color.fromRGBO(255, 98, 211, 1),
              fontWeight: FontWeight.w400,
              fontSize: 36,
            ),
          ),
          SizedBox(
            height: 286,
            child: Transform.translate(
              offset: Offset(0, -40), // 위로 이동할 양을 조정하십시오.
              child: Text(
                candidate.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 240,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
