import 'package:flutter/material.dart';

import '../choi/choi_game_page.dart';
import '../four/four_game_page.dart';
import '../person/person_game_page.dart';
import '../tele/tele_game_page.dart';

class HomeApp extends StatelessWidget {
  const HomeApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    const List<String> _GameNames = <String>[
      '인물퀴즈',
      '디스코',
      '대표게임',
      '네글자퀴즈',
      '단어텔레파시',
      '텔레스트레이션',
      '액션초성게임',
      '노래초성퀴즈',
      '명대사퀴즈',
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/home.gif'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Center(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(height: height * 0.24),
            Image.asset('assets/images/title.png',
                width: width * 0.91, height: height * 0.067),
            SizedBox(height: height * 0.147),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(5, (index) {
                return Column(
                  children: [
                    GameList(index: index + 1, name: _GameNames[index]),
                    SizedBox(height: height * 0.0246)
                  ],
                );
              }),
            ),
          ]),
        ),
      ]),
    );
  }
}

class GameList extends StatefulWidget {
  final int index;
  final String name;
  const GameList({super.key, required this.index, required this.name});

  @override
  State<GameList> createState() => _GameListState();
}

class _GameListState extends State<GameList> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 4),
          width: 300,
          height: 40,
          child: ElevatedButton(
              onPressed: () {
                switch (widget.index) {
                  case 1:
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const PersonGamePage()));
                    break;
                  case 2:
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ChoiGamePage()));
                    break;
                  case 3:
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ChoiGamePage()));
                    break;
                  case 4:
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const FourGamePage()));
                    break;
                  case 5:
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const TeleGamePage()));
                    break;
                  case 6:
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ChoiGamePage()));
                    break;
                  case 7:
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ChoiGamePage()));
                    break;
                  case 8:
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ChoiGamePage()));
                    break;
                  case 9:
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ChoiGamePage()));
                    break;
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                disabledBackgroundColor: Colors.transparent,
                foregroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11),
                ),
              ),
              child: Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                color: Colors.transparent,
                child: Text(
                  widget.name,
                  style: const TextStyle(
                    fontFamily: 'DungGeunMo',
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )),
        ),
      ],
    );
  }
}

//호버 있는 모바일 버전//
// import 'package:flutter/material.dart';

// import '../choi/choi_page.dart';
// import '../four/four_page.dart';
// import '../person/person_page.dart';
// import '../random/random_page.dart';
// import '../tele/tele_page.dart';

// class HomeApp extends StatelessWidget {
//   const HomeApp({
//     super.key,
//     required this.gameName,
//   });

//   final List<String> gameName;

//   @override
//   Widget build(BuildContext context) {
//     var width = MediaQuery.of(context).size.width;
//     var height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Stack(children: [
//         Container(
//           decoration: const BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage('assets/images/home.gif'),
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),
//         Center(
//           child:
//               Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
//             SizedBox(height: height * 0.24),
//             Image.asset('assets/images/title.png',
//                 width: width * 0.91, height: height * 0.067),
//             SizedBox(height: height * 0.147),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: List.generate(5, (index) {
//                 return Column(
//                   children: [
//                     GameList(index: "${index + 1}", name: gameName[index]),
//                     SizedBox(height: height * 0.0246)
//                   ],
//                 );
//               }),
//             ),
//           ]),
//         ),
//       ]),
//     );
//   }
// }

// class GameList extends StatefulWidget {
//   final String index;
//   final String name;
//   const GameList({super.key, required this.index, required this.name});

//   @override
//   State<GameList> createState() => _GameListState();
// }

// class _GameListState extends State<GameList> {
//   bool _isMouseOver = false;

//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       onEnter: (_) {
//         setState(() {
//           _isMouseOver = true;
//         });
//       },
//       onExit: (_) {
//         setState(() {
//           _isMouseOver = false;
//         });
//       },
//       child: Stack(
//         alignment: Alignment.center,
//         children: [
//           Container(
//             padding: const EdgeInsets.only(bottom: 4),
//             width: 300,
//             height: 40,
//             child: Visibility(
//               visible: !_isMouseOver,
//               child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.baseline,
//                   textBaseline: TextBaseline.alphabetic,
//                   children: [
//                     const SizedBox(width: 54),
//                     Text(
//                       widget.name,
//                       style: const TextStyle(
//                         fontFamily: 'DungGeunMo',
//                         color: Colors.white,
//                         fontSize: 34,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                   ]),
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.only(bottom: 4),
//             width: 300,
//             height: 40,
//             child: Visibility(
//               visible: _isMouseOver,
//               child: ElevatedButton(
//                   onPressed: () {
//                     switch (widget.index) {
//                       case '1':
//                         Navigator.of(context).push(MaterialPageRoute(
//                             builder: (context) => const ChoiPage()));
//                         break;
//                       case '2':
//                         Navigator.of(context).push(MaterialPageRoute(
//                             builder: (context) => const PersonPage()));
//                         break;
//                       case '3':
//                         Navigator.of(context).push(MaterialPageRoute(
//                             builder: (context) => const FourPage()));
//                         break;
//                       case '4':
//                         Navigator.of(context).push(MaterialPageRoute(
//                             builder: (context) => const TelePage()));
//                         break;
//                       case '5':
//                         Navigator.of(context).push(MaterialPageRoute(
//                             builder: (context) => const RandomPage()));
//                         break;
//                     }
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.transparent,
//                     disabledBackgroundColor: Colors.transparent,
//                     foregroundColor: Colors.transparent,
//                     shadowColor: Colors.transparent,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(11),
//                     ),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       SizedBox(
//                           width: 16,
//                           height: 28,
//                           child: Image.asset('assets/images/gameover.png')),
//                       const SizedBox(width: 13),
//                       Container(
//                         padding: const EdgeInsets.only(left: 10, right: 10),
//                         color: const Color.fromRGBO(255, 98, 211, 1),
//                         child: Text(
//                           widget.name,
//                           style: const TextStyle(
//                             fontFamily: 'DungGeunMo',
//                             color: Colors.white,
//                             fontSize: 34,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                       ),
//                     ],
//                   )),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
