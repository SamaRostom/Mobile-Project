// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/user_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'package:flutter_application_1/drawing.dart';

class Twoplayers extends ConsumerStatefulWidget {
  const Twoplayers({super.key});

  @override

  // ignore: library_private_types_in_public_api
  ConsumerState<Twoplayers> createState() => _TwoplayersState();
}

class _TwoplayersState extends ConsumerState<Twoplayers> {
  List<String> displayElement = ['', '', '', '', '', '', '', '', ''];

  int oScore = 0;

  int xScore = 0;

  int filledBoxes = 0;

  bool oTurn = true;

  String lastvalue = "X";

  void _tapped(int index) {
    setState(() {
      if (oTurn && displayElement[index] == '') {
        displayElement[index] = 'O';

        filledBoxes++;
      } else if (!oTurn && displayElement[index] == '') {
        displayElement[index] = 'X';

        filledBoxes++;
      }

      oTurn = !oTurn;

      _checkWinner();
    });
  }

  void _checkWinner() {
    // Checking rows

    if (displayElement[0] == displayElement[1] &&
        displayElement[0] == displayElement[2] &&
        displayElement[0] != '') {
      _showWinDialog(displayElement[0]);
    }

    if (displayElement[3] == displayElement[4] &&
        displayElement[3] == displayElement[5] &&
        displayElement[3] != '') {
      _showWinDialog(displayElement[3]);
    }

    if (displayElement[6] == displayElement[7] &&
        displayElement[6] == displayElement[8] &&
        displayElement[6] != '') {
      _showWinDialog(displayElement[6]);
    }

    // Checking Column

    if (displayElement[0] == displayElement[3] &&
        displayElement[0] == displayElement[6] &&
        displayElement[0] != '') {
      _showWinDialog(displayElement[0]);
    }

    if (displayElement[1] == displayElement[4] &&
        displayElement[1] == displayElement[7] &&
        displayElement[1] != '') {
      _showWinDialog(displayElement[1]);
    }

    if (displayElement[2] == displayElement[5] &&
        displayElement[2] == displayElement[8] &&
        displayElement[2] != '') {
      _showWinDialog(displayElement[2]);
    }

    // Checking Diagonal

    if (displayElement[0] == displayElement[4] &&
        displayElement[0] == displayElement[8] &&
        displayElement[0] != '') {
      _showWinDialog(displayElement[0]);
    }

    if (displayElement[2] == displayElement[4] &&
        displayElement[2] == displayElement[6] &&
        displayElement[2] != '') {
      _showWinDialog(displayElement[2]);
    } else if (filledBoxes == 9) {
      _showDrawDialog();
    }
  }

  void _showWinDialog(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("\" $winner \" is Winner!!!"),
            actions: [
              ElevatedButton(
                child: const Text("Play Again"),
                onPressed: () {
                  _clearBoard();

                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });

    if (winner == 'O') {
      // oScore++;
      ref.read(scoreOProivder.notifier).state += 1;
    } else if (winner == 'X') {
      // xScore++;
      ref.read(scoreXProivder.notifier).state += 1;
    }
  }

  void _showDrawDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Draw"),
            actions: [
              ElevatedButton(
                child: const Text("Play Again"),
                onPressed: () {
                  _clearBoard();

                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayElement[i] = '';
      }
    });

    filledBoxes = 0;
  }

  void _clearScoreBoard() {
    setState(() {
      // xScore = 0;
      // oScore = 0;
      ref.read(scoreOProivder.notifier).state = 0;
      ref.read(scoreXProivder.notifier).state = 0;

      for (int i = 0; i < 9; i++) {
        displayElement[i] = '';
      }
    });

    filledBoxes = 0;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconButton(
            // alignment: Alignment.topLeft,

            icon: const Icon(Icons.arrow_back),

            color: Colors.white,

            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Expanded(
            // creating the ScoreBoard

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Padding(

                // padding: const EdgeInsets.all(30.0),

                // child:

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(ref.watch(nickname1Proivder),style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),),
                    const Text(
                      'Player X',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Colors.white),
                    ),
                    Text(
                      // xScore.toString(),
                      ref.watch(scoreXProivder).toString(),
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),

                // ),

                // Padding(

                // padding: const EdgeInsets.all(30.0),

                // child:

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(ref.watch(nickname2Proivder),style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),),
                    const Text('     Player O',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            color: Colors.white)),
                    Text(
                      // oScore.toString(),
                      ref.watch(scoreOProivder).toString(),
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),

                // ),
              ],
            ),
          ),
          Expanded(
            // Creating the Board for Tic tac toe

            flex: 4,

            child: GridView.builder(
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      _tapped(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white)),
                      child: Center(
                        child: Text(
                          displayElement[index],
                          style: const TextStyle(
                              color: Colors.white, fontSize: 35),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          Expanded(

              // Button for Clearing the Enter board

              // as well as Scoreboard to start allover again

              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  //   color: Colors.indigo[50],

                  // textColor: Colors.black,

                  //primary: Colors.transparent,

                  shape: RoundedRectangleBorder(
                    //to set border radius to button

                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: _clearScoreBoard,
                child: const Text("Clear Score Board"),
              ),
            ],
          ))
        ],
      )),
    );
  }
}
