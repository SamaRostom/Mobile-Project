import 'package:flutter/material.dart';
import 'dart:math';

class Players {
  static const x = "X";
  static const o = "O";
  static const empty = "";
}

class Game {
  static final boardlenth = 9;
  static final blocSize = 100.0;

  List<String>? board;
  static List<String>? initGameBoard() =>
      List.generate(boardlenth, (index) => Players.empty);
}

class Data {
  //adding the number of tries
  static int tries = 0;
  static List<String> selectedChar = [];
  static var chosed; 
  static var player=1;
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

  static List<Map> Hangscore = [
    {
      'Rank': 1,
      'Name': 'Player',
      'Date': '22-Mar-31',
      'Score': 7
    },
    {
      'Rank': 2,
      'Name': 'Ahmed',
      'Date': '22-Apr-1',
      'Score': 6
    },
    {
      'Rank': 3,
      'Name': 'Noor',
      'Date': '22-May-12',
      'Score': 5
    },
    {
      'Rank': 4,
      'Name': 'Pl',
      'Date': '22-Mar-26',
      'Score': 2
    },
    {
      'Rank': 5,
      'Name': 'Sara',
      'Date': '22-Feb-12',
      'Score': 1
    },
  ];

  static List<Map> xoscore = [
    {
      'Rank': 1,
      'Name': 'play',
      'Date': '22-Mar-31',
      'Score': 7
    },
    {
      'Rank': 2,
      'Name': 'Ahmed',
      'Date': '22-Apr-1',
      'Score': 4
    },
    {
      'Rank': 3,
      'Name': 'Noor',
      'Date': '22-May-12',
      'Score': 3
    },
    {
      'Rank': 4,
      'Name': 'Pl',
      'Date': '22-Mar-26',
      'Score': 1
    },
    {
      'Rank': 5,
      'Name': 'Sara',
      'Date': '22-Feb-12',
      'Score': 1
    },
  ];

  // Random rnd = Random();
  // static List<String> categories = ["Animals","Sports","Countries"];
  // static const List<String> wordList = ["DOG","COW","CAT","HORSE","DONKEY"];
    static var cc;
    static List<String> animals = ["DOG","COW","CAT","HORSE","DONKEY"];
    static List<String> sports = ["Football","Tennis","Baseball","Squash","Swimming"];
    static List<String> countries = ["Egypt","America","France","Germany","China"];
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