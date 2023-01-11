import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/Hangman/HangmanGame.dart';
// import 'package:hangtoetest/engine/figure_image.dart';
import 'package:flutter_application_1/Utils/data.dart';

const TextStyle activeWordStyle = TextStyle(
  fontSize: 30.0,
  letterSpacing: 5.0,
);

class HangmanPage extends StatefulWidget {
  final HangmanGame obj;

  HangmanPage(this.obj);

  @override
  State<StatefulWidget> createState() => _HangmanPageState();
}

class _HangmanPageState extends State<HangmanPage> {
  late bool showNewGame;
  // late String activeImage;
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
      // activeImage = Data.progressImages[wrongGuessCount];

      for (int i = 0; i <= wrongGuessCount; i++) {
        Data.progressImages[i];
      }

      // for(int i=0; i<=wrongGuessCount; i++){
      //   _activeImage = progressImages[i];
      // }

      // if(wrongGuessCount == 0){
      //   _activeImage = progressImages[0];
      // }

      // if(wrongGuessCount == 1){
      //   _activeImage = progressImages[0];
      //   _activeImage = progressImages[1];
      // }

      // if(wrongGuessCount == 2){
      //   _activeImage = progressImages[0];
      //   _activeImage = progressImages[1];
      //   _activeImage = progressImages[2];
      // }
    });
  }

  void win([_]) {
    setState(() {
      // activeImage = Data.victoryImage;
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
      // activeImage = Data.progressImages[0];
      showNewGame = false;
    });
  }

  Widget renderBottomContent() {
    if (showNewGame) {
      return ElevatedButton(
        child: const Text('New Game'),
        onPressed: newGame,
      );
    } else {
      final Set<String> lettersGuessed = widget.obj.lettersGuessed;

      return Wrap(
        spacing: 1.0,
        runSpacing: 1.0,
        alignment: WrapAlignment.center,
        children: Data.alphabets
            .map((letter) => MaterialButton(
                  child: Text(letter),
                  padding: const EdgeInsets.all(2.0),
                  onPressed: lettersGuessed.contains(letter)
                      ? null
                      : () {
                          widget.obj.guessLetter(letter);
                        },
                ))
            .toList(),
      );
    }
  }

// static int hanged = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 118, 20, 136),
      appBar: AppBar(
        title: const Text('Hangman'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Image
            // Expanded(
            //   // child: Image.asset(activeImage),
            //   child: Image.asset(updateGallowsImage(3)),
            // ),
            // Word
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Text(activeWord, style: activeWordStyle),
              ),
            ),
            // Controls
            Expanded(
              child: Center(
                // child: this.renderBottomContent(),
                child: renderBottomContent(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
