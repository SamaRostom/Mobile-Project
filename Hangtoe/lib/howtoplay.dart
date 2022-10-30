import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/data.dart';

// ignore: camel_case_types
class Howtoplay extends StatelessWidget {
  const Howtoplay({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  color: Colors.white,
                  onPressed: () {Navigator.pop(context); },
                ),
                  const Text(
                    'How to play',
                     style: TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                        letterSpacing: 3.0,
                      ),
                  ),
                ],
              ),
            const SizedBox(
              height: 100,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: 
               [
                Data.chosed == 'hangman'?
                const Text('''
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
                  style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                ):
                const Text(
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
                  style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}