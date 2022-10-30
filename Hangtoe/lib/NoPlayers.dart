import 'package:flutter/material.dart';
import 'package:flutter_application_1/data.dart';
import 'package:google_fonts/google_fonts.dart';

class PName extends StatefulWidget {
  const PName({super.key});

  @override

  // ignore: library_private_types_in_public_api

  _PNameState createState() => _PNameState();
}

class _PNameState extends State<PName> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              'TO Start The Game please Enter The Players Name',
              textAlign: TextAlign.center,
              style: GoogleFonts.patrickHand(fontSize: 25, color: Colors.white),
            ),
            const SizedBox(
              height: 100,
            ),
            Data.player == 2
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const TextField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          focusColor: Colors.white,
                          hoverColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Colors.white),
                          ),
                          hintText: 'Enter 1 Player Name',
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const TextField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Colors.white),
                          ),
                          hintText: 'Enter 2 Player Name',
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      SizedBox(
                        height: 50, //height of button
                        width: 120,

                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                //to set border radius to button
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/gamehome');
                          },
                          child: Text('Play',
                              style: GoogleFonts.patrickHand(
                                fontSize: 25,
                              )),
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      const TextField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          // border: OutlineInputBorder(),

                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Colors.white),
                          ),

                          hintText: 'Enter Player Name',
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      SizedBox(
                        height: 50, //height of button

                        width: 120,

                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(

                                //to set border radius to button

                                borderRadius: BorderRadius.circular(20)),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/gamehome');
                          },
                          child: Text('Play',
                              style: GoogleFonts.patrickHand(
                                fontSize: 25,
                              )),
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
