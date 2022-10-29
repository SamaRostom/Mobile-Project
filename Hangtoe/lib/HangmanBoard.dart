import 'package:flutter/material.dart';
import 'package:flutter_application_1/data.dart';

class HangmanBoard extends StatefulWidget {
  const HangmanBoard({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HangmanBoardState createState() => _HangmanBoardState();
}

class _HangmanBoardState extends State<HangmanBoard>{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          //choosing the game word
          //   List<String> getAlphebat() {
          //   List<String> alphabets = [];
          //   for (int i = 65; i <= 90; i++) {
          //     alphabets.add(String.fromCharCode(i));
          //   }
          //   return alphabets;
          // }
          children: [
            //for (int i = 65; i <= 90; i++){
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder( //to set border radius to button
                  borderRadius: BorderRadius.circular(20)
                ),
              ),
              onPressed: () {}, 
              child: const Text('Hangman',style: TextStyle(fontSize: 20,),),
            ),
          //}  
          ],
        ),
      ),
    );
  }
}


