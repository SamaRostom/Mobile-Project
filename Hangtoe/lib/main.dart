import 'package:flutter/material.dart';
import 'package:flutter_application_1/Home.dart';
import 'package:flutter_application_1/scores.dart';
import 'package:flutter_application_1/NoPlayers.dart';
import 'package:flutter_application_1/gamehome.dart';
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
      ),
      // home: const HomeScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/scores': (context) => const scores(),
        '/NoPlayers': (context) => const Players(),
        '/gamehome': (context) => const gamehome(),
        // '/HangmanBoard': (context) => const HangmanBoard(),
      },
    );
  }
}

