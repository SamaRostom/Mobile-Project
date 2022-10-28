import 'package:flutter/material.dart';
import 'package:flutter_application_1/data.dart';

class Gamehome extends StatefulWidget {
  const Gamehome({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GamehomeState createState() => _GamehomeState();
}

class _GamehomeState extends State<Gamehome>{
  // check(){
  //    if(Data.chosed == "hangman"){
  //       return "Hangman";
  //    }else{
  //       return"Tic Tac Toe";
  //    }
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisSize: MainAxisSize.max,
          children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  IconButton(
                  // alignment: Alignment.topLeft,  
                  icon: const Icon(Icons.arrow_back),
                  color: Colors.white,
                  onPressed: () {Navigator.pop(context); },
                ),
                  const SizedBox(
                    height: 160,
                  ),
                  Data.chosed == 'hangman'?
                     const Text(
                      'HANGMAN',
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                        // fontWeight: FontWeight.w300,
                        letterSpacing: 3.0,
                        // fonts.asset('fonts/FiraMono-Bold.ttf'),
                        fontFamily: 'FiraMono',
                      ),
                    ):
                     const Text(
                      'TICTACTOE',
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                        // fontWeight: FontWeight.w300,
                        letterSpacing: 3.0,
                        // fonts.asset('fonts/FiraMono-Bold.ttf'),
                        fontFamily: 'FiraMono',
                      ),
                    ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // mainAxisSize: MainAxisSize.max,
                children:[
                  Data.chosed == 'hangman'?
                  Image.asset(
                      'assets/gallow.png',
                      width: 200,
                      height: 200,
                  ):
                  Image.asset(
                      'assets/toe.png',
                      width: 200,
                      height: 200,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   SizedBox(
                     height:70, //height of button
                      width:180, //width of button
                     child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder( //to set border radius to button
                      borderRadius: BorderRadius.circular(20)
                        ),
                      ),
                      onPressed: () {
                        Data.chosed == 'hangman'?
                        Navigator.pushNamed(context, '/HangmanBoard'):Navigator.pushNamed(context, '/tictactoe');
                        }, 
                      child: const Text('Play',style: TextStyle(fontSize: 20,),),
                      ),
                   ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   SizedBox(
                     height:70, //height of button
                      width:180, //width of button
                     child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder( //to set border radius to button
                      borderRadius: BorderRadius.circular(20)
                        ),
                      ),
                      onPressed: () {Navigator.pushNamed(context, '/howtoplay');}, 
                      child: const Text('How to play',style: TextStyle(fontSize: 20,),),
                      ),
                   ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   SizedBox(
                     height:70, //height of button
                      width:180, //width of button
                     child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder( //to set border radius to button
                      borderRadius: BorderRadius.circular(20)
                        ),
                      ),
                      onPressed: () {Navigator.pushNamed(context, '/scores');}, 
                      child: const Text('High Scores',style: TextStyle(fontSize: 20,),),
                      ),
                   ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}


