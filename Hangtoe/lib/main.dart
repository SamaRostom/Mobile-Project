import 'package:flutter/material.dart';
import 'package:flutter_application_1/HangmanBoard.dart';
import 'package:flutter_application_1/Home.dart';
import 'package:flutter_application_1/scores.dart';
import 'package:flutter_application_1/NoPlayers.dart';
import 'package:flutter_application_1/gamehome.dart';
import 'package:flutter_application_1/howtoplay.dart';
import 'package:flutter_application_1/PNames.dart';
// import 'package:flutter_application_1/HangmanBoard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hangtoe',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF421b9b),
        //scaffoldBackgroundColor: const Color.fromARGB(255, 132, 81, 250),
        // scaffoldBackgroundColor: Color.fromARGB(255, 160, 120, 247),
      ),
      // home: const HomeScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/scores': (context) => const Scores(),
        '/NoPlayers': (context) => const Players(),
        '/gamehome': (context) => const Gamehome(),
        '/howtoplay': (context) => const Howtoplay(),
        '/HangmanBoard': (context) => const HangmanBoard(),
        '/PNames': (context) => const PName(),
      },
    );
  }
}

