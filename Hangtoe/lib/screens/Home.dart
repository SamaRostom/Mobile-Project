import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utils/data.dart';
import 'package:flutter_application_1/Utils/size_config.dart';
import 'package:flutter_application_1/providers/score_provider.dart';
// import 'package:flutter_application_1/screens/Hangman/game_screen.dart';
// import 'package:flutter_application_1/screens/Hangman/type_word_screen.dart';
import 'package:flutter_application_1/screens/Login.dart';
import 'package:flutter_application_1/screens/NoPlayers.dart';
import 'package:flutter_application_1/screens/Signup.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../providers/user_provider.dart';
// import '../services/score_service.dart';
// import '../Utils/constants.dart';
import '../services/user_service.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static const routeName = "/home-screen";

  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.indigo),
        drawer: Data.loggedin == false
            ? Drawer(
                child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: const BoxDecoration(
                      color: Colors.indigo,
                    ),
                    child: Text(
                      'Pages',
                      style: GoogleFonts.patrickHand(
                          fontSize: 40, color: Colors.white),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.person_add,
                      color: Colors.indigo,
                    ),
                    title: Text(
                      'Sign up',
                      style: GoogleFonts.patrickHand(
                          fontSize: 30, color: Colors.indigo),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, Signup.routeName);
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.login,
                      color: Colors.indigo,
                    ),
                    title: Text(
                      'Log in',
                      style: GoogleFonts.patrickHand(
                          fontSize: 30, color: Colors.indigo),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, Login.routeName);
                    },
                  ),
                ],
              ))
            : Drawer(
                child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: const BoxDecoration(
                      color: Colors.indigo,
                    ),
                    child: Text(
                      'Pages',
                      style: GoogleFonts.patrickHand(
                          fontSize: 40, color: Colors.white),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.logout,
                      color: Colors.indigo,
                    ),
                    title: Text(
                      'Log out',
                      style: GoogleFonts.patrickHand(
                          fontSize: 30, color: Colors.indigo),
                    ),
                    onTap: () async {
                      UserService.logOut(context);
                    },
                  ),
                ],
              )),
        body: Column(
          children: [
            Container(
              height: getProportionateScreenHeight(120), //height of button
              width: getProportionateScreenWidth(300), //width of button
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  SizedBox(
                    height: getProportionateScreenHeight(50),
                  ),
                  Text(
                    'HANGTOE',
                    style: GoogleFonts.patrickHand(
                        fontSize: getProportionateScreenWidth(65),
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Image.asset(
                  'assets/homepic.png',
                  width: getProportionateScreenWidth(200),
                  height: getProportionateScreenHeight(130),
                ),
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            Data.loggedin
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome  ${ref.watch(newUserDataProivder)!.username}',
                        style: GoogleFonts.kanit(
                            fontSize: getProportionateScreenWidth(25),
                            color: Colors.white),
                      ),
                    ],
                  )
                : SizedBox(
                    height: getProportionateScreenHeight(50),
                  ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Lets play',
                  style: GoogleFonts.kanit(
                      fontSize: getProportionateScreenWidth(25),
                      color: Colors.white),
                ),
                SizedBox(width: getProportionateScreenWidth(5)),
                Icon(
                  Icons.gamepad_outlined,
                  color: const Color.fromARGB(255, 177, 96, 209),
                  size: getProportionateScreenWidth(30),
                )
              ],
            ),
            // ),
            SizedBox(
              height: getProportionateScreenHeight(50),
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
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      ref.read(typeofgameProivder.notifier).state = "hangman";
                      Navigator.pushNamed(context, NoPlayers.routeName);
                      Data.chosed = "hangman";
                    },
                    child: Text(
                      'Hangman',
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(20),
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
                  height: getProportionateScreenHeight(80), //height of button
                  width: getProportionateScreenWidth(170), //width of button
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          //to set border radius to button
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    onPressed: () {
                      ref.read(typeofgameProivder.notifier).state = "xo";
                      Navigator.pushNamed(context, NoPlayers.routeName);
                      Data.chosed = "xo";
                    },
                    child: Text(
                      'Tic Tac Toe',
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
