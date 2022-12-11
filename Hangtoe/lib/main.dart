import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/HangmanBoard.dart';
import 'package:flutter_application_1/screens/Home.dart';
import 'package:flutter_application_1/screens/scores.dart';
import 'package:flutter_application_1/screens/NoPlayers.dart';
import 'package:flutter_application_1/screens/gamehome.dart';
import 'package:flutter_application_1/screens/howtoplay.dart';
import 'package:flutter_application_1/screens/PNames.dart';
import 'package:flutter_application_1/screens/Tic_tac_toe.dart';
import 'package:flutter_application_1/screens/Login.dart';
import 'package:flutter_application_1/screens/Signup.dart';
import 'package:flutter_application_1/screens/Dictionary.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

// void main() {
//   runApp(const MyApp());
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
        '/Tic_tac_toe': (context) => const Tictactoe(),
        '/Login': (context) => const Login(),
        '/Signup': (context) => const Signup(),
        '/Dictionary': (context) => const Dictionary(),
      },
    );
  }
}
