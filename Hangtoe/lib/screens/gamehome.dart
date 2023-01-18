import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utils/constants.dart';
import 'package:flutter_application_1/Utils/data.dart';
import 'package:flutter_application_1/screens/Hangman/categories.dart';
import 'package:flutter_application_1/screens/Hangman/type_word_screen.dart';
import 'package:flutter_application_1/screens/NoPlayers.dart';
import 'package:flutter_application_1/screens/Tic_tac%20_toe/singleplayerAI.dart';
import 'package:flutter_application_1/screens/howtoplay.dart';
import 'package:flutter_application_1/screens/scores.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Utils/data.dart' as val;
import '../Utils/size_config.dart';
import 'Hangman/game_screen.dart';

class Gamehome extends StatefulWidget {
  static const routeName = "/gamehome-screen";

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
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            Padding(
              padding: const EdgeInsets.only(right:40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  IconButton(
                    // alignment: Alignment.topLeft,
                    icon: Icon(Icons.arrow_back, size: getProportionateScreenWidth(20),),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(15),
                  ),
                  Data.chosed == 'hangman'
                      ? Text(
                          'HANGMAN',
                          style: GoogleFonts.patrickHand(
                              fontSize: getProportionateScreenWidth(70), color: Colors.white),
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
                              fontSize: getProportionateScreenWidth(60), color: Colors.white),
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
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // mainAxisSize: MainAxisSize.max,
              children: [
                Data.chosed == 'hangman'
                    ? Image.asset(
                        'assets/gallow.png',
                        width: getProportionateScreenWidth(200),
                        height: getProportionateScreenHeight(200),
                      )
                    : Image.asset(
                        'assets/xo1.png',
                        width: getProportionateScreenWidth(200),
                        height: getProportionateScreenHeight(200),
                      ),
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(80),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(80), //height of button
                  width: getProportionateScreenWidth(170), //width of button
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          //to set border radius to button
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    onPressed: () {
                      if (Data.chosed == 'hangman') {
                        // Navigator.pushNamed(
                        //     context, GameScreen.routeName);
                        if (Data.type == "Oneplayer") {
                          if (Data.loggedin) {
                            Navigator.pushNamed(
                                context, Categories.routeName);
                          } else {
                            error("Login", "you need to log in to play");
                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(val.snackBar);
                          }
                        } else if (Data.type == "Twoplayer") {
                          Navigator.pushNamed(
                              context, TypeWordScreen.routeName);
                        }
                      } else {
                        if (Data.type == "Oneplayer") {
                          if (Data.loggedin) {
                            Navigator.pushNamed(context, SinglepalyerAI.routeName);
                          } else {
                            error("Login", "you need to log in to play");
                            // TextButton(
                            //   child: const Text(
                            //     'Login',
                            //     style: TextStyle(
                            //         fontSize: 20,
                            //         decoration: TextDecoration.underline,
                            //         color: Colors.white),
                            //   ),
                            //   onPressed: () {
                            //     Navigator.pushNamed(context, '/Login');
                            //   },
                            // );
                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(val.snackBar);
                          }
                        } else if (Data.type == "Twoplayer") {
                          Navigator.pushNamed(context, NoPlayers.routeName);
                        } else if (Data.type == "Room") {
                          Navigator.pushNamed(context, '/main_menu_screen');
                          // Navigator.pushReplacementNamed(context, mainmenuscreen.routeName);
                        }
                      }
                    },
                    child: Text(
                      'Play',
                      style: TextStyle(
                        fontSize:  getProportionateScreenWidth(20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(80), //height of button
                  width: getProportionateScreenWidth(170), //width of button
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          //to set border radius to button
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, HowToPlay.routeName);
                    },
                    child: Text(
                      'How to play',
                      style: TextStyle(
                        fontSize:  getProportionateScreenWidth(20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(80), //height of button
                  width: getProportionateScreenWidth(170), //width of button
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          //to set border radius to button
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, Scores.routeName);
                    },
                    child: Text(
                      'High Scores',
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(20),
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
