import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utils/data.dart';
import 'package:flutter_application_1/widgets/loading_widget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/seemoregames_model.dart';
import '../services/seemoregames_service.dart';

class HowToPlay extends StatefulWidget {
  static const routeName = "/howtoplay-screen";

  const HowToPlay({super.key});

  @override
  State<StatefulWidget> createState() => _HowToPlayState();
}

class _HowToPlayState extends State<HowToPlay> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Text(
                  'How to play',
                  style: GoogleFonts.patrickHand(
                      fontSize: 60, color: Colors.white),
                  //  TextStyle(
                  //     fontSize: 50,
                  //     color: Colors.white,
                  //     letterSpacing: 3.0,
                  //   ),
                ),
                //const IconButton(Icons.lightbulb,color: Color.fromARGB(255, 255, 234, 49), size: 50.0, onPressed(){})
                IconButton(
                  icon: const Icon(
                    Icons.lightbulb,
                    size: 50.0,
                  ),
                  color: const Color.fromARGB(255, 255, 234, 49),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(
              height: 70,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Data.chosed == 'hangman'
                    ? Text(
                        '''
          In the game of Hangman, 
          a clue word is given by 
          the program that the player
          has to guess , letter by 
          letter and if the player 
          selects an incorrect letter, 
          one part of the hangman body 
          is drawn. If the full body 
          is drawn the player loses, 
          otherwise the correct letter 
          is found and the player wins.''',
                        style: GoogleFonts.kanit(
                            fontSize: 25, color: Colors.white),
                        // TextStyle(
                        //       fontSize: 25,
                        //       color: Colors.white,
                        //     ),
                      )
                    : Text(
                        '''
      Tic-tac-toe is a puzzle game 
      for two players, X and O, 
      who take turns marking the 
      spaces in a 3×3 grid. The 
      player who succeeds in placing 
      three of their marks in a 
      horizontal, vertical, or diagonal 
      row wins the game.
          ''',
                        style: GoogleFonts.kanit(
                            fontSize: 25, color: Colors.white),
                        // TextStyle(
                        //       fontSize: 25,
                        //       color: Colors.white,
                        //     ),
                      )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/SeeMoreGames');
                  },
                  child: const Text(
                    'See more games',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
