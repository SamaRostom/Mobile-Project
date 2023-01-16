import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Hangman2/categories.dart';
import 'package:flutter_application_1/screens/Hangman2/game_screen.dart';
import 'package:flutter_application_1/screens/Hangman2/lose_screen.dart';
import 'package:flutter_application_1/screens/Hangman2/type_word_screen.dart';
import 'package:flutter_application_1/screens/Hangman2/win_screen.dart';
import 'package:flutter_application_1/screens/Home.dart';
import 'package:flutter_application_1/screens/Tic_tac%20_toe/singleplayerAI.dart';
import 'package:flutter_application_1/screens/scores.dart';
import 'package:flutter_application_1/screens/NoPlayers.dart';
import 'package:flutter_application_1/screens/gamehome.dart';
import 'package:flutter_application_1/screens/howtoplay.dart';
import 'package:flutter_application_1/screens/PNames.dart';
import 'package:flutter_application_1/screens/Login.dart';
import 'package:flutter_application_1/screens/Signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screens/Hangman/twoplayershang.dart';
import 'screens/Tic_tac _toe/create_room_screen.dart';
import 'screens/Tic_tac _toe/join_room_screen.dart';
// import 'screens/Tic_tac _toe/room_screen.dart';
import 'screens/Tic_tac _toe/twoplayers.dart';
import 'screens/seemoregames.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: MyApp()));
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
      initialRoute: Login.routeName,
      // initialRoute: '/Players',
      routes: {
        '/': (context) => const HomeScreen(),
        Scores.routeName: (context) => const Scores(),
        NoPlayers.routeName: (context) => const NoPlayers(),
        TwoplayersHangman.routeName: (context) => const TwoplayersHangman(),
        Gamehome.routeName: (context) => const Gamehome(),
        HowToPlay.routeName: (context) => const HowToPlay(),
        // '/HangmanBoard': (context) => const HangmanBoard(),
        PName.routeName: (context) => const PName(),
        // RoomScreen.routeName: (context) => const RoomScreen(),
        JoinRoomScreen.routeName: (context) => const JoinRoomScreen(),
        // CreateRoomScreen.routeName: (context) => const CreateRoomScreen(),
        SinglepalyerAI.routeName: (context) => const SinglepalyerAI(),
        Twoplayers.routeName: (context) => const Twoplayers(),
        // '/Tic_tac_toe': (context) => const Tictactoe(),
        Login.routeName: (context) => const Login(),
        Signup.routeName: (context) => const Signup(),
        Categories.routeName: (context) => const Categories(),
        SeeMoreGames.routeName: (context) => const SeeMoreGames(),

        GameScreen.routeName: (context) => const GameScreen(),
        LoseScreen.routeName: (context) => const LoseScreen(),
        WinScreen.routeName: (context) => const WinScreen(),
        TypeWordScreen.routeName: (context) => const TypeWordScreen(),
      },
    );
  }
}
