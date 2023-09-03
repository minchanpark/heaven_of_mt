import 'package:flutter/material.dart';

import 'choi/Candidate_choi.dart';

class GameCard extends StatelessWidget {
  final ChoiCandidateModel candidate;

  const GameCard(
    this.candidate, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '${candidate.index} / 10',
          style: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
            fontSize: 50,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 7,
                offset: const Offset(0, 3),
              )
            ],
          ),
          alignment: Alignment.center,
          child: Container(
            height: 500,
            child: Text(
              candidate.name,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 300,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
