import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
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
                  const SizedBox(
                    height: 170,
                  ),
                  const Text(
                      'HANGTOE',
                      style: TextStyle(
                        fontSize: 60,
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children:[
                  Image.asset(
                      'assets/game.png',
                      ),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const[
                   Text(
                      'Lets play',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   SizedBox(
                     height:80, //height of button
                      width:200, //width of button
                     child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder( //to set border radius to button
                      borderRadius: BorderRadius.circular(20)
                        ),
                      ),
                      onPressed: () {Navigator.pushNamed(context, '/scores');}, 
                      child: const Text('Hangman',style: TextStyle(fontSize: 20,),),
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
                     height:80, //height of button
                      width:200, //width of button
                     child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder( //to set border radius to button
                      borderRadius: BorderRadius.circular(20)
                        ),
                      ),
                      onPressed: () {Navigator.pushNamed(context, '/NoPlayers');}, 
                      child: const Text('Tic Tac Toe',style: TextStyle(fontSize: 20,),),
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


