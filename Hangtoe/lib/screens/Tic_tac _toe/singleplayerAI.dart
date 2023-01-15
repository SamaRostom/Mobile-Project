import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/score_provider.dart';
import 'package:flutter_application_1/services/score_service.dart';
import 'package:flutter_application_1/widgets/game_button.dart';
import 'package:flutter_application_1/widgets/custom_dailog.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../providers/user_provider.dart';
import '../../services/user_service.dart';

class SinglepalyerAI extends ConsumerStatefulWidget {
  static const routeName = "/singlepalyerai-screen";

  const SinglepalyerAI({super.key});

  @override
  ConsumerState<SinglepalyerAI> createState() => _SinglepalyerAIState();
}

class _SinglepalyerAIState extends ConsumerState<SinglepalyerAI> {
  late List<GameButton> buttonsList;
  var player1;
  var player2;
  var activePlayer;
  var score = 0;
  @override
  void initState() {
    super.initState();
    buttonsList = doInit();
  }

  List<GameButton> doInit() {
    player1 = [];
    player2 = [];
    activePlayer = 1;
    var gameButtons = <GameButton>[
      GameButton(id: 1),
      GameButton(id: 2),
      GameButton(id: 3),
      GameButton(id: 4),
      GameButton(id: 5),
      GameButton(id: 6),
      GameButton(id: 7),
      GameButton(id: 8),
      GameButton(id: 9),
    ];
    return gameButtons;
  }

  void playGame(GameButton gb) {
    setState(() {
      if (activePlayer == 1) {
        gb.text = "X";
        activePlayer = 2;
        player1.add(gb.id);
      } else {
        gb.text = "0";
        activePlayer = 1;
        player2.add(gb.id);
      }
      gb.enabled = false;
      int winner = checkWinner();
      if (winner == -1) {
        if (buttonsList.every((p) => p.text != "")) {
          showDialog(
              context: context,
              builder: (_) => CustomDialog("Game Tied",
                  "Press the reset button to start again.", resetGame));
        } else {
          activePlayer == 2 ? autoPlay() : null;
        }
      }
    });
  }

  void autoPlay() {
    var emptyCells = [];
    var list = List.generate(9, (i) => i + 1);
    for (var cellID in list) {
      if (!(player1.contains(cellID) || player2.contains(cellID))) {
        emptyCells.add(cellID);
      }
    }
    var r = Random();
    var randIndex = r.nextInt(emptyCells.length - 1);
    var cellID = emptyCells[randIndex];
    int i = buttonsList.indexWhere((p) => p.id == cellID);
    playGame(buttonsList[i]);
  }

  int checkWinner() {
    var winner = -1;
    if (player1.contains(1) && player1.contains(2) && player1.contains(3)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(2) && player2.contains(3)) {
      winner = 2;
    }
// row 2
    if (player1.contains(4) && player1.contains(5) && player1.contains(6)) {
      winner = 1;
    }
    if (player2.contains(4) && player2.contains(5) && player2.contains(6)) {
      winner = 2;
    }
// row 3
    if (player1.contains(7) && player1.contains(8) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(7) && player2.contains(8) && player2.contains(9)) {
      winner = 2;
    }
// col 1
    if (player1.contains(1) && player1.contains(4) && player1.contains(7)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(4) && player2.contains(7)) {
      winner = 2;
    }
// col 2
    if (player1.contains(2) && player1.contains(5) && player1.contains(8)) {
      winner = 1;
    }
    if (player2.contains(2) && player2.contains(5) && player2.contains(8)) {
      winner = 2;
    }
// col 3
    if (player1.contains(3) && player1.contains(6) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(3) && player2.contains(6) && player2.contains(9)) {
      winner = 2;
    }
//diagonal
    if (player1.contains(1) && player1.contains(5) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(5) && player2.contains(9)) {
      winner = 2;
    }
    if (player1.contains(3) && player1.contains(5) && player1.contains(7)) {
      winner = 1;
    }
    if (player2.contains(3) && player2.contains(5) && player2.contains(7)) {
      winner = 2;
    }
    if (winner != -1) {
      if (winner == 1) {
        // ref.read(newUserDataProivder.notifier).state!.score +=5;
        // ref.watch(newUserDataProivder)!.score += 5;
        score += 5;
        if (score > ref.watch(scoreProivder)) {
          ref.read(scoreProivder.notifier).state = score;
        }
        showDialog(
            context: context,
            builder: (_) => CustomDialog("You are the winner",
                "Press the reset button to start again.", resetGame));
      } else {
        showDialog(
            context: context,
            builder: (_) => CustomDialog("The AI won",
                "Press the reset button to start again.", resetGame));
      }
    }
    return winner;
  }

  void resetGame() {
    if (Navigator.canPop(context)) Navigator.pop(context);
    // UserService.updateScore(ref);
    ScoreService.saveScore(ref);
    setState(() {
      buttonsList = doInit();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const SizedBox(
          height: 20,
        ),
        IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        Center(
          child: Text(
            "High Score:  ${ref.watch(scoreProivder)}",
            style: GoogleFonts.kanit(fontSize: 25, color: Colors.white),
          ),
        ),
        Center(
            child: Text(
          "Score:  $score",
          style: GoogleFonts.kanit(fontSize: 25, color: Colors.white),
        )),
        const SizedBox(
          height: 40,
        ),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(10.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                crossAxisSpacing: 9.0,
                mainAxisSpacing: 9.0),
            itemCount: buttonsList.length,
            itemBuilder: (context, i) => SizedBox(
              width: 100.0,
              height: 100.0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonsList[i].bg,
                  padding: const EdgeInsets.all(8.0), // Background color
                ),
                onPressed: buttonsList[i].enabled
                    ? () => playGame(buttonsList[i])
                    : null,
                child: Text(
                  buttonsList[i].text,
                  style: const TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
            ),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 252, 251, 252),
            padding: const EdgeInsets.all(20.0), // Background color
          ),
          onPressed: resetGame,
          child: const Text(
            "Reset",
            style:
                TextStyle(color: Color.fromRGBO(142, 68, 173, 1), fontSize: 30),
          ),
        ),
      ],
    ));
  }
}
