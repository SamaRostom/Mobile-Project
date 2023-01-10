import 'dart:async';

class HangmanGame {
  static const int hanged = 6;       // number of wrong guesses before the player's demise
    // static int hanged = 0;	

  final List<String> wordList;			// list of possible words to guess
  final Set<String> lettersGuessed = new Set<String>();

  List<String> wordToGuess =[];
  int wrongGuesses=0;

  StreamController<Null> _onWin = new StreamController<Null>.broadcast();
  Stream<Null> get onWin => _onWin.stream;

  StreamController<Null> _onLose = new StreamController<Null>.broadcast();
  Stream<Null> get onLose => _onLose.stream;

  StreamController<int> _onWrong = new StreamController<int>.broadcast();
  Stream<int> get onWrong => _onWrong.stream;

  StreamController<String> _onRight = new StreamController<String>.broadcast();
  Stream<String> get onRight => _onRight.stream;

  StreamController<String> _onChange = new StreamController<String>.broadcast();
  Stream<String> get onChange => _onChange.stream;

  HangmanGame(List<String> words) : wordList =  List<String>.from(words);

  void newGame() {
    // shuffle the word list into a random order
    wordList.shuffle();

    // break the first word from the shuffled list into a list of letters
    wordToGuess = wordList.first.split('');

    // reset the wrong guess count
    wrongGuesses = 0;

    // clear the set of guessed letters
    lettersGuessed.clear();

    // declare the change (new word)
    _onChange.add(wordForDisplay);
  }

  void guessLetter(String letter) {
    // store guessed letter
    lettersGuessed.add(letter);

    // if the guessed letter is present in the word, check for a win
    // otherwise, check for player death
    if (wordToGuess.contains(letter)) {
      _onRight.add(letter);

      if (isWordComplete) {
        _onChange.add(fullWord);
        _onWin.add(null);
      }
      else {
        _onChange.add(wordForDisplay);
      }
    }
    else {
      wrongGuesses++;

      _onWrong.add(wrongGuesses);

      if (wrongGuesses == hanged) {
        _onChange.add(fullWord);
        _onLose.add(null);
      }
    }
  }

  int get wrongGuessesG => wrongGuesses;
  List<String> get wordToGuessL => wordToGuess;
  String get fullWord => wordToGuess.join();

// replace correct guessed letter
  String get wordForDisplay => wordToGuessL.map((String letter) =>
    lettersGuessed.contains(letter) ? letter : "_").join();

  // check to see if every letter in the word has been guessed
  bool get isWordComplete {
    for (String letter in wordToGuess) {
      if (!lettersGuessed.contains(letter)) {
        return false;
      }
    }

    return true;
  }
}