// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter_application_1/Utils/data.dart';
// import 'package:flutter_application_1/main.dart';
// import 'package:flutter_application_1/Utils/data.dart';
// import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/models/Hangman/letter.dart';
import 'package:flutter_application_1/models/Hangman/figure_image.dart';
import 'package:flutter_application_1/models/Hangman/HangmanGame.dart';
// import 'package:flutter_application_1/drawing.dart';

const TextStyle activeWordStyle = TextStyle(
  fontSize: 30.0,
  letterSpacing: 5.0,
);

class HangmanBoard extends StatefulWidget {
  static const routeName = "/hangmanboard-screen";

  final HangmanGame obj;
  const HangmanBoard({super.key, required this.obj});
  // HangmanBoard(this.obj);
  @override

  //original hena fe el code el adem
  // _HangmanBoardState createState() => _HangmanBoardState();

  // mn el code el gded fe hangmanui
  State<StatefulWidget> createState() => _HangmanBoardState();
}

class _HangmanBoardState extends State<HangmanBoard> {
  //choosing the game word
  // String word = Data.cc[0].toUpperCase();
  // animals.shuffle();
  //Create a list that contains the Alphabet, or you can just copy and paste it

  late bool showNewGame;
  late String activeImage;
  late String activeWord;

  @override
  void initState() {
    super.initState();

    widget.obj.onChange.listen(updateWordDisplay);
    widget.obj.onWrong.listen(updateGallowsImage);
    widget.obj.onWin.listen(win);
    widget.obj.onLose.listen(gameOver);

    newGame();
  }

  void updateWordDisplay(String word) {
    setState(() {
      activeWord = word;
    });
  }

  void updateGallowsImage(int wrongGuessCount) {
    setState(() {
      //In the original code -->
      activeImage = Data.progressImages[wrongGuessCount];
    });
  }

  void win([_]) {
    setState(() {
      activeImage = Data.victoryImage;
      gameOver();
    });
  }

  void gameOver([_]) {
    setState(() {
      showNewGame = true;
    });
  }

  void newGame() {
    widget.obj.newGame();

    setState(() {
      activeWord = '';
      activeImage = Data.progressImages[0];
      showNewGame = false;
    });
  }

  Widget renderBottomContent() {
    if (showNewGame) {
      return ElevatedButton(
        child: const Text('New Game'),
        onPressed: newGame,
      );
    }
    // }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Hangman"),
          elevation: 0,
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Stack(
                children: [
                  //figure will be built according to the number of tries
                  figureImage(Data.tries >= 0, "assets/hang.png"),
                  figureImage(Data.tries >= 1, "assets/head.png"),
                  figureImage(Data.tries >= 2, "assets/body.png"),
                  figureImage(Data.tries >= 3, "assets/ra.png"),
                  figureImage(Data.tries >= 4, "assets/la.png"),
                  figureImage(Data.tries >= 5, "assets/rl.png"),
                  figureImage(Data.tries >= 6, "assets/ll.png"),
                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:
                  //split the word letter by letter
                  activeWord
                      .split('')
                      .map((e) => letter(e.toUpperCase(),
                          !Data.selectedChar.contains(e.toUpperCase())))
                      .toList(),
            ),

            //Game keyboard
            SizedBox(
              height: 250.0,
              child: GridView.count(
                crossAxisCount: 7,
                crossAxisSpacing: 8.0,
                padding: EdgeInsets.all(8.0),
                children: Data.alphabets.map((e) {
                  return RawMaterialButton(
                    onPressed: Data.selectedChar.contains(e)
                        ? null // check that we didn't selected the button before
                        : () {
                            setState(() {
                              Data.selectedChar.add(e);
                              // ignore: avoid_print
                              print(Data.selectedChar);
                              //  count wrong guesses
                              if (!activeWord
                                  .split('')
                                  .contains(e.toUpperCase())) {
                                Data.tries++;
                              }
                              //  return to home page when the draw is fully drawn
                              if (Data.tries == 6) {
                                Navigator.pushNamed(context, '/');
                              }
                            });
                          },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    // ignore: sort_child_properties_last
                    child: Text(
                      e,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    fillColor: Data.selectedChar.contains(e)
                        ? Colors.black87
                        : Colors.blue,
                  );
                }).toList(),
              ),
            )
          ],
        ),
      );
    }

    throw UnimplementedError();
  }

  // kan feh error fe line 34 (class _HangmanBoardState extends State<HangmanBoard> {)
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
