import 'package:flutter/material.dart';

import 'package:flutter_application_1/Utils/data.dart';

import 'package:google_fonts/google_fonts.dart';

class Players extends StatefulWidget {
  const Players({super.key});

  @override

  // ignore: library_private_types_in_public_api

  _PlayersState createState() => _PlayersState();
}

class _PlayersState extends State<Players> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          // crossAxisAlignment: CrossAxisAlignment.center,

          // mainAxisSize: MainAxisSize.max,

          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_back),
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Image.asset(
              'assets/Friends.png',
              width: 200,
              height: 200,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Choose The Number Of Players To Start The Game",
              textAlign: TextAlign.center,
              style: GoogleFonts.patrickHand(fontSize: 35, color: Colors.white),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 60, //height of button

                  width: 200, //width of button

                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(

                          //to set border radius to button

                          borderRadius: BorderRadius.circular(20)),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/PNames');

                      Data.player = 1;
                    },
                    child: const Text(
                      '1 Player',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 60, //height of button

                  width: 200, //width of button

                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(

                          //to set border radius to button

                          borderRadius: BorderRadius.circular(20)),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/PNames');

                      Data.player = 2;
                    },
                    child: const Text(
                      '2 Players',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 60, //height of button

                  width: 200, //width of button

                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(

                          //to set border radius to button

                          borderRadius: BorderRadius.circular(20)),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/main_menu_screen');

                      Data.player = 2;
                    },
                    child: const Text(
                      'Rooms',
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
