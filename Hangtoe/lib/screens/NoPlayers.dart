import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utils/data.dart';
// import 'package:flutter_application_1/providers/hangman_provider.dart';
// import 'package:flutter_application_1/providers/score_provider.dart';
import 'package:flutter_application_1/screens/PNames.dart';
import 'package:flutter_application_1/screens/gamehome.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Utils/size_config.dart';

class NoPlayers extends ConsumerStatefulWidget {
  static const routeName = "/noplayers-screen";

  const NoPlayers({super.key});

  @override
  ConsumerState<NoPlayers> createState() => _PlayersState();
}

class _PlayersState extends ConsumerState<NoPlayers> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: ListView(
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
              width: getProportionateScreenWidth(200),
              height: getProportionateScreenWidth(200),
            ),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            SizedBox(
              width: getProportionateScreenWidth(15),
              height: getProportionateScreenHeight(90),
              child: Text(
                '''Choose The Number Of Players To 
   Start The Game''',
                textAlign: TextAlign.center,
                style: GoogleFonts.patrickHand(
                    fontSize: getProportionateScreenWidth(22),
                    color: Colors.white),
              ),
            ),
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
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    onPressed: () {
                      Data.type = "Oneplayer";
                      Navigator.pushNamed(context, Gamehome.routeName);
                      Data.noofplayers = 1;
                    },
                    child: Text(
                      '1 Player',
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(40),
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
                      Data.type = "Twoplayer";
                      Navigator.pushNamed(context, PName.routeName);
                      Data.noofplayers = 2;
                    },
                    child: Text(
                      '2 Players',
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
          ],
        ),
      ),
    );
  }
}
