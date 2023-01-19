import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utils/data.dart';
import 'package:flutter_application_1/screens/seemoregames.dart';
// import 'package:flutter_application_1/widgets/loading_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Utils/size_config.dart';
// import '../models/seemoregames_model.dart';
// import '../services/seemoregames_service.dart';

class HowToPlay extends StatefulWidget {
  static const routeName = "/howtoplay-screen";

  const HowToPlay({super.key});

  @override
  State<StatefulWidget> createState() => _HowToPlayState();
}

class _HowToPlayState extends State<HowToPlay> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                SizedBox(
                  width: getProportionateScreenWidth(10),
                ),
                Text(
                  'How to play',
                  style: GoogleFonts.patrickHand(
                      fontSize: getProportionateScreenWidth(60),
                      color: Colors.white),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(2),
                ), 
                  Icon(
                    Icons.lightbulb,
                    size: getProportionateScreenWidth(50.0),
                    color: const Color.fromARGB(255, 255, 234, 49),
                  ),
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(70),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Data.chosed == 'hangman'
                    ? Text(
                       Data.hangDescr,
                        style: GoogleFonts.kanit(
                            fontSize: getProportionateScreenWidth(20),
                            color: Colors.white),
                      )
                    : Text(
                        Data.xoDescr,
                        style: GoogleFonts.kanit(
                            fontSize: getProportionateScreenWidth(20),
                            color: Colors.white),
                      )
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(70),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, SeeMoreGames.routeName);
                  },
                  child: Text(
                    'See more games',
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(20),
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
