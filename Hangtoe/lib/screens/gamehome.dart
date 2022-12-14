import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utils/data.dart';
import 'package:google_fonts/google_fonts.dart';

class Gamehome extends StatefulWidget {
  const Gamehome({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GamehomeState createState() => _GamehomeState();
}

class _GamehomeState extends State<Gamehome> {
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
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(
                  height: 160,
                ),
                Data.chosed == 'hangman'
                    ? Text(
                        'HANGMAN',
                        style: GoogleFonts.patrickHand(
                            fontSize: 70, color: Colors.white),
                        // TextStyle(
                        //   fontSize: 50,
                        //   color: Colors.white,
                        //   // fontWeight: FontWeight.w300,
                        //   letterSpacing: 3.0,
                        //   // fonts.asset('fonts/FiraMono-Bold.ttf'),
                        //   fontFamily: 'FiraMono',
                        // ),
                      )
                    : Text(
                        'TICTACTOE',
                        style: GoogleFonts.patrickHand(
                            fontSize: 60, color: Colors.white),
                        // TextStyle(
                        //   fontSize: 50,
                        //   color: Colors.white,
                        //   // fontWeight: FontWeight.w300,
                        //   letterSpacing: 3.0,
                        //   // fonts.asset('fonts/FiraMono-Bold.ttf'),
                        //   fontFamily: 'FiraMono',
                        // ),
                      ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // mainAxisSize: MainAxisSize.max,
              children: [
                Data.chosed == 'hangman'
                    ? Image.asset(
                        'assets/gallow.png',
                        width: 200,
                        height: 200,
                      )
                    : Image.asset(
                        'assets/xo1.png',
                        width: 150,
                        height: 150,
                      ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 70, //height of button
                  width: 180, //width of button
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          //to set border radius to button
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    onPressed: () {
                      if (Data.chosed == 'hangman') {
                        Navigator.pushNamed(context, '/Dictionary');
                      } else {
                        if (Data.type == "Oneplayer") {
                          Navigator.pushNamed(context, '/singleplayerAI');
                        } else if (Data.type == "Twoplayer") {
                          Navigator.pushNamed(context, '/Twoplayers');
                        } else if (Data.type == "Room") {
                          Navigator.pushNamed(context, '/main_menu_screen');
                        }
                      }
                    },
                    child: const Text(
                      'Play',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
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
                  height: 70, //height of button
                  width: 180, //width of button
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          //to set border radius to button
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/howtoplay');
                    },
                    child: const Text(
                      'How to play',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
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
                  height: 70, //height of button
                  width: 180, //width of button
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          //to set border radius to button
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/scores');
                    },
                    child: const Text(
                      'High Scores',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
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
