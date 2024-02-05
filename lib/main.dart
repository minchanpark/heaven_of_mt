import 'dart:js' as js;

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:heaven_of_mt/church_game/church_captain.dart';
import 'package:heaven_of_mt/gameover/gameover_web.dart';
import 'church_game/church_disco.dart';
import 'church_game/church_four.dart';
import 'firebase_options.dart';
import 'game_page/captain/captain_game_page.dart';
import 'game_page/choi/choi_game_page.dart';
import 'game_page/disco/disco_game_page.dart';
import 'game_page/four/four_game_page.dart';
import 'game_page/movie/movie_game_page.dart';
import 'game_page/musictitle/category_musictitle.dart';
import 'game_page/tele/tele_game_page.dart';
import 'game_page/telestration/telestration_game_page.dart';
import 'home/home_church.dart';
import 'home/home.dart';
import 'game_page/person/person_game_page.dart';
import 'splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        '/splash': (BuildContext context) => const SplashPage(),
        '/home': (BuildContext context) => const MyHome(),
        '/person': (BuildContext context) => const PersonGamePage(),
        '/disco': (BuildContext context) => const DiscoGamePage(),
        '/captain': (BuildContext context) => const CaptainGamePage(),
        '/four': (BuildContext context) => const FourGamePage(),
        '/tele': (BuildContext context) => const TeleGamePage(),
        '/telestration': (BuildContext context) => const TelestrationGamePage(),
        '/choi': (BuildContext context) => const ChoiGamePage(),
        '/category': (BuildContext context) => const CategoryPage(),
        '/movie': (BuildContext context) => const MovieGamePage(),
        '/church': (BuildContext context) => const ChurchPage(),
        '/church_disco': (BuildContext context) => const ChurchDiscoGame(),
        '/church_captain': (BuildContext context) => const ChurchCaptainGame(),
        '/church_four': (BuildContext context) => const ChurchFourGame(),
      },
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: analytics),
      ],
    ),
  );
  js.context.callMethod('ChannelIO', [
    'boot',
    {"pluginKey": "4cf501ee-0328-4a70-af7e-edb184d5981f"}
  ]);
}

class GameOverArguments {
  final String gameName;

  GameOverArguments({required this.gameName});
}
