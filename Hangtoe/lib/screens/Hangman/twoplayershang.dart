import 'package:flutter/material.dart';

import 'package:flutter_application_1/Utils/data.dart';
import 'package:flutter_application_1/screens/PNames.dart';
import 'package:flutter_application_1/screens/gamehome.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:google_fonts/google_fonts.dart';

// import '../providers/user_provider.dart';

class TwoplayersHangman extends ConsumerStatefulWidget {
  static const routeName = "/twoplayershangman-screen";

  const TwoplayersHangman({super.key});

  @override

  // ignore: library_private_types_in_public_api

  ConsumerState<TwoplayersHangman> createState() => _TwoplayersHangmanState();
}

class _TwoplayersHangmanState extends ConsumerState<TwoplayersHangman> {
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
                Navigator.of(context).pop();
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
                      Data.type = "Oneplayer";
                      // final userData = ref.watch(playernameProivder);
                      Navigator.pushNamed(context, Gamehome.routeName);

                      Data.noofplayers = 1;
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
                      Data.type = "Twoplayer";
                      Navigator.pushNamed(context, PName.routeName);

                      Data.noofplayers = 2;
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
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     SizedBox(
            //       height: 60, //height of button

            //       width: 200, //width of button

            //       child: ElevatedButton(
            //         style: ElevatedButton.styleFrom(
            //           shape: RoundedRectangleBorder(

            //               //to set border radius to button

            //               borderRadius: BorderRadius.circular(20)),
            //         ),
            //         onPressed: () {
            //           Data.type = "Room";
            //           Navigator.pushNamed(context, '/main_menu_screen');

            //           Data.player = 2;
            //         },
            //         child: const Text(
            //           'Rooms',
            //           style: TextStyle(
            //             fontSize: 20,
            //           ),
            //         ),
            // ),
            // ),
            // ],
            // ),
          ],
        ),
      ),
    );
  }
}
