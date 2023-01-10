import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/Hangman/HangmanGame.dart';
// import 'package:flutter_application_1/Utils/data.dart';
// import 'package:flutter_application_1/models/Hangman/figure_image.dart';
// import 'package:flutter_application_1/Utils/data.dart';

// import 'package:hangtoetest/engine/figure_image.dart';

List<String> progressImages = const [
  'assets/hang.png',
  'assets/head.png',
  'assets/body.png',
  'assets/ra.png',
  'assets/la.png',
  'assets/rl.png',
  'assets/ll.png',
];


const String victoryImage = 'assets/victory.png';

List<String> alphabet = const [
  'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
  'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
];

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
  late bool _showNewGame;
  late String _activeImage;
  late String _activeWord;

  @override
  void initState() {
    super.initState();

    widget.obj.onChange.listen(_updateWordDisplay);
    widget.obj.onWrong.listen(_updateGallowsImage);
    widget.obj.onWin.listen(_win);
    widget.obj.onLose.listen(_gameOver);

    _newGame();
  }

  void _updateWordDisplay(String word) {
    setState(() {
      _activeWord = word;
    });
  }

  void _updateGallowsImage(int wrongGuessCount) {
    setState(() {
      //In the original code -->
      _activeImage = progressImages[wrongGuessCount];

      // mn page HangmanBoard el adema
      // another way to display el image wara ba3d
        // figureImage(Data.tries >= 0, "assets/hang.png");
        // figureImage(Data.tries >= 1, "assets/head.png");
        // figureImage(Data.tries >= 2, "assets/body.png");
        // figureImage(Data.tries >= 3, "assets/ra.png");
        // figureImage(Data.tries >= 4, "assets/la.png");
        // figureImage(Data.tries >= 5, "assets/rl.png");
        // figureImage(Data.tries >= 6, "assets/ll.png");


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

  void _win([_]) {
    setState(() {
      _activeImage = victoryImage;
      _gameOver();
    });
  }

  void _gameOver([_]) {
    setState(() {
      _showNewGame = true;
    });
  }

  void _newGame() {
    widget.obj.newGame();

    setState(() {
      _activeWord = '';
      _activeImage = progressImages[0];
      _showNewGame = false;
    });
  }

  Widget _renderBottomContent() {
    if (_showNewGame) {
      return ElevatedButton(
        child: const Text('New Game'),
        onPressed: _newGame,
      );
    } else {
      final Set<String> lettersGuessed = widget.obj.lettersGuessed;

      return Wrap(
        spacing: 1.0,
        runSpacing: 1.0,
        alignment: WrapAlignment.center,
        children: alphabet.map((letter) => MaterialButton(
          child: Text(letter),
          padding: const EdgeInsets.all(2.0),
          onPressed: lettersGuessed.contains(letter) ? null : () {
            widget.obj.guessLetter(letter);
          },
        )).toList(),
      );


          //Game keyboard in HangmanBoard
          // SizedBox(
          //   height: 250.0,
          //   child: GridView.count(
          //     crossAxisCount: 7,
          //     crossAxisSpacing: 8.0,
          //     padding: EdgeInsets.all(8.0),
          //     children: Data.alphabet.map((e) {
          //       return RawMaterialButton(
          //         onPressed: Data.selectedChar.contains(e)
          //             ? null // check that we didn't selected the button before
          //             : () {
          //                 setState(() {
          //                   Data.selectedChar.add(e);
          //                   // ignore: avoid_print
          //                   print(Data.selectedChar);
          //                   //  count wrong guesses
          //                   // if (!word.split('').contains(e.toUpperCase())) {
          //                   //   Data.tries++;
          //                   // }
          //                   //  return to home page when the draw is fully drawn
          //                   if(Data.tries == 6){
          //                     Navigator.pushNamed(context, '/');
          //                   }
          //                 });
          //               },
          //         shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(4.0),
          //         ),
          //         // ignore: sort_child_properties_last
          //         child: Text(
          //           e,
          //           style: TextStyle(
          //             color: Colors.white,
          //             fontSize: 30.0,
          //             fontWeight: FontWeight.bold,
          //           ),
          //         ),
          //         fillColor: Data.selectedChar.contains(e)
          //             ? Colors.black87
          //             : Colors.blue,
          //       );
          //     }).toList(),
          //   ),
          // );

    }
  }

// static int hanged = 0;

@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 118, 20, 136),
      appBar: AppBar(
        title: Text('Hangman'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Image
            Expanded(
              child: Image.asset(_activeImage),
            ),
            // Word
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Center(
                child: Text(_activeWord, style: activeWordStyle),
              ),
            ),
            // Controls
            Expanded(
              child: Center(
                child: this._renderBottomContent(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}