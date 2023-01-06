import 'package:flutter/material.dart';

class Data {
  //adding the number of tries
  static int tries = 0;
  static List<String> selectedChar = [];
  // ignore: prefer_typing_uninitialized_variables
  static var chosed;
  static var player = 1;
  static Color primaryColorDark = const Color(0xFF231954);
  static int numOfRows = 5;
  static List<String> topRanks = ["🥇", "🥈", "🥉"];
  // static List<List<String>> hscoreslist = [
  //   ['1', 'Player','20-Mar-31','7'],
  //   ['2', 'Ahmed','20-Apr-1','6'],
  //   ['3', 'Noor','20-May-12','5'],
  //   ['4', 'Pl','20-Mar-26','2'],
  //   ['5', 'Sara','20-Feb-12','1'],
  // ];
  // static List<List<String>> tscoreslist = [
  //   ['1', 'play','20-Mar-31','7'],
  //   ['2', 'Ahmed','20-Apr-1','4'],
  //   ['3', 'Noor','20-May-12','3'],
  //   ['4', 'Pl','20-Mar-26','1'],
  //   ['5', 'Sara','20-Feb-12','1'],
  // ];

  // ignore: non_constant_identifier_names
  static List<Map> Hangscore = [
    {'rank': 1, 'player_name': 'Player', 'date': '22-Mar-31', 'score': 7, 'typeofgame':'hangman'},
    {'rank': 2, 'player_name': 'Ahmed', 'date': '22-Apr-1', 'score': 6,'typeofgame':'hangman'},
    {'rank': 3, 'player_name': 'Noor', 'date': '22-May-12', 'score': 5,'typeofgame':'hangman'},
    {'rank': 4, 'player_name': 'Pl', 'date': '22-Mar-26', 'score': 2,'typeofgame':'hangman'},
    {'rank': 5, 'player_name': 'Sara', 'date': '22-Feb-12', 'score': 1,'typeofgame':'hangman'},
  ];

  static List<Map> xoscore = [
    {'rank': 1, 'player_name': 'play', 'date': '22-Mar-31', 'score': 7,'typeofgame':'xo'},
    {'rank': 2, 'player_name': 'Ahmed', 'date': '22-Apr-1', 'score': 4,'typeofgame':'xo'},
    {'rank': 3, 'player_name': 'Noor', 'date': '22-May-12', 'score': 3,'typeofgame':'xo'},
    {'rank': 4, 'player_name': 'Pl', 'date': '22-Mar-26', 'score': 1,'typeofgame':'xo'},
    {'rank': 5, 'player_name': 'Sara', 'date': '22-Feb-12', 'score': 1,'typeofgame':'xo'},
  ];

  // Random rnd = Random();
  // static List<String> categories = ["Animals","Sports","Countries"];
  // static const List<String> wordList = ["DOG","COW","CAT","HORSE","DONKEY"];
  // ignore: prefer_typing_uninitialized_variables
  static var cc;
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
}
