
import 'package:flutter/material.dart';


class HangmanBoard extends StatefulWidget {
  const HangmanBoard({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HangmanBoardState createState() => _HangmanBoardState();
}


class _HangmanBoardState extends State<HangmanBoard>{
  @override
  //choosing the game word
  String word = "Flutter".toUpperCase();
  //Create a list that contains the Alphabet, or you can just copy and paste it
  List<String> alphabets = [
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