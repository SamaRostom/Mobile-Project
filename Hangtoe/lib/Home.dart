import 'package:flutter/material.dart';
import 'package:flutter_application_1/data.dart';
import 'package:google_fonts/google_fonts.dart';

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
        appBar: AppBar(backgroundColor: Colors.indigo),
        drawer: Drawer(
            child: ListView(
          padding: EdgeInsets.zero,
          children: [
             DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.indigo,
              ),
              child: Text('Pages',style: GoogleFonts.patrickHand( fontSize: 40,color: Colors.white), ),
            ),
            ListTile(
              leading: const Icon(
              Icons.person_add,
              color: Colors.indigo,
            ),
              title: Text('Sign up',style: GoogleFonts.patrickHand( fontSize: 30,color: Colors.indigo), ),
              onTap: () {Navigator.pushNamed(context, '/Signup');},
            ),
            ListTile(
              leading: const Icon(
              Icons.login,
              color: Colors.indigo,
            ),
              title:  Text('Log in',style: GoogleFonts.patrickHand( fontSize: 30,color: Colors.indigo), ),
              onTap: () {Navigator.pushNamed(context, '/Login');},
            ),
            ListTile(
              leading: const Icon(
              Icons.logout,
              color: Colors.indigo,
            ),
              title:  Text('Log out',style: GoogleFonts.patrickHand( fontSize: 30,color: Colors.indigo), ),
              onTap: () {Navigator.pushNamed(context, '/');},
            ),
          ],
        )),

        body: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisSize: MainAxisSize.max,
          children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const SizedBox(
                    height: 150,
                  ),
                   Text(
                      'HANGTOE',
                      style: 
                      GoogleFonts.patrickHand
                      (
                        // textStyle: Theme.of(context).textTheme.headline4,
                        fontSize: 75,
                        // fontWeight: FontWeight.w700,
                        color: Colors.white
                      ),
                      // TextStyle(
                      //   fontSize: 60,
                      //   color: Colors.white,
                      //   // fontWeight: FontWeight.w300,
                      //   letterSpacing: 3.0,
                      //   // fonts.asset('fonts/FiraMono-Bold.ttf'),
                      //   fontFamily: 'FiraMono',
                        
                      // ),)
                    ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children:[
                  // Padding(
                  //   padding: const EdgeInsets.all(50),
                  //   child: const AnimatedRotation(
                  //     turns: 5,
                  //     duration: Duration(seconds: 2),
                  //     child: FlutterLogo(),
                  //   ),),
                  Image.asset(
                      'assets/4.png',
                      width: 200,
                      height: 130,
                      ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text(
                      'Lets play',
                      style: 
                      GoogleFonts.kanit
                      (
                        fontSize: 25,
                        color: Colors.white
                      ),
                      // TextStyle(
                      //   fontSize: 20,
                      //   color: Colors.white,
                      // ),
                    ),
                    const Icon(Icons.gamepad_outlined,color: Color.fromARGB(255, 177, 96, 209),)
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
                      //primary: Colors.transparent,  
                      shape: RoundedRectangleBorder( //to set border radius to button
                      borderRadius: BorderRadius.circular(20), 
                        ),
                      ),
                      onPressed: () {Navigator.pushNamed(context, '/NoPlayers');Data.chosed="hangman";}, 
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
                      //primary: Colors.transparent, 
                      shape: RoundedRectangleBorder( //to set border radius to button
                      borderRadius: BorderRadius.circular(20)
                        ),
                      ),
                      onPressed: () {Navigator.pushNamed(context, '/NoPlayers');Data.chosed="x";}, 
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


