import 'package:flutter/material.dart';

var snackBar;

class Data {
  static var noofplayers;
  static bool loggedin = false;
  //adding the number of tries
  static int tries = 0;
  static List<String> selectedChar = [];
  // ignore: prefer_typing_uninitialized_variables
  static var chosed;
  static var player = 1;
  static Color primaryColorDark = const Color(0xFF231954);
  static int numOfRows = 5;
  static List<String> topRanks = ["🥇", "🥈", "🥉"];
  static var type;

  // ignore: non_constant_identifier_names
  static List<Map> Hangscore = [
    {
      'rank': 1,
      'player_name': 'Player',
      'date': '22-Mar-31',
      'score': 7,
      'typeofgame': 'hangman'
    },
    {
      'rank': 2,
      'player_name': 'Ahmed',
      'date': '22-Apr-1',
      'score': 6,
      'typeofgame': 'hangman'
    },
    {
      'rank': 3,
      'player_name': 'Noor',
      'date': '22-May-12',
      'score': 5,
      'typeofgame': 'hangman'
    },
    {
      'rank': 4,
      'player_name': 'Pl',
      'date': '22-Mar-26',
      'score': 2,
      'typeofgame': 'hangman'
    },
    {
      'rank': 5,
      'player_name': 'Sara',
      'date': '22-Feb-12',
      'score': 1,
      'typeofgame': 'hangman'
    },
  ];

  static List<Map> xoscore = [
    {
      'rank': 1,
      'player_name': 'play',
      'date': '22-Mar-31',
      'score': 7,
      'typeofgame': 'xo'
    },
    {
      'rank': 2,
      'player_name': 'Ahmed',
      'date': '22-Apr-1',
      'score': 4,
      'typeofgame': 'xo'
    },
    {
      'rank': 3,
      'player_name': 'Noor',
      'date': '22-May-12',
      'score': 3,
      'typeofgame': 'xo'
    },
    {
      'rank': 4,
      'player_name': 'Pl',
      'date': '22-Mar-26',
      'score': 1,
      'typeofgame': 'xo'
    },
    {
      'rank': 5,
      'player_name': 'Sara',
      'date': '22-Feb-12',
      'score': 1,
      'typeofgame': 'xo'
    },
  ];
  // ignore: prefer_typing_uninitialized_variables
  static var category;
  static List<String> animals = ["DOG", "COW", "CAT", "HORSE", "DONKEY"];
  static List<String> sports = [
    "Football",
    "Tennis",
    "Baseball",
    "Squash",
    "Swimming"
  ];
  static List<String> countries = [
    "Egypt",
    "America",
    "France",
    "Germany",
    "China"
  ];
  static List<Map> categories = [
    {
      'Animals': 'DOG',
      'Sports': 'football',
      'Countries': 'Egypt',
    },
    {
      'Animals': 'COW',
      'Sports': 'tennis',
      'Countries': 'America',
    },
    {
      'Animals': 'CAT',
      'Sports': 'baseball',
      'Countries': 'France',
    },
    {
      'Animals': 'HORSE',
      'Sports': 'squash',
      'Countries': 'Germany',
    },
    {
      'Animals': 'DONKEY',
      'Sports': 'swimming',
      'Countries': 'China',
    },
  ];
  static List<String> alphabets = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z"
  ];

  static List<String> progressImages = const [
    'assets/hang.png',
    'assets/head.png',
    'assets/body.png',
    'assets/ra.png',
    'assets/la.png',
    'assets/rl.png',
    'assets/ll.png',
  ];

  static const String victoryImage = 'assets/victory.png';

  static const List<String> wordList = [
    "PLENTY",
    "ACHIEVE",
    "CLASS",
    "STARE",
    "AFFECT",
    "THICK",
    "CARRIER",
    "BILL",
    "SAY",
    "ARGUE",
    "OFTEN",
    "GROW",
    "VOTING",
    "SHUT",
    "PUSH",
    "FANTASY",
    "PLAN",
    "LAST",
    "ATTACK",
    "COIN",
    "ONE",
    "STEM",
    "SCAN",
    "ENHANCE",
    "PILL",
    "OPPOSED",
    "FLAG",
    "RACE",
    "SPEED",
    "BIAS",
    "HERSELF",
    "DOUGH",
    "RELEASE",
    "SUBJECT",
    "BRICK",
    "SURVIVE",
    "LEADING",
    "STAKE",
    "NERVE",
    "INTENSE",
    "SUSPECT",
    "WHEN",
    "LIE",
    "PLUNGE",
    "HOLD",
    "TONGUE",
    "ROLLING",
    "STAY",
    "RESPECT",
    "SAFELY"
  ];
}
