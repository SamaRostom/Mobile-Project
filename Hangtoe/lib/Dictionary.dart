import 'package:flutter/material.dart';
import 'package:flutter_application_1/data.dart';
import 'package:google_fonts/google_fonts.dart';

class Dictionary extends StatefulWidget {
  const Dictionary({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DictionaryState createState() => _DictionaryState();
}

class _DictionaryState extends State<Dictionary> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 200,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                  // alignment: Alignment.topLeft,
                  icon: const Icon(Icons.arrow_back),
                  color: Colors.white,
                  onPressed: () {Navigator.pop(context); },
                ),
                   Text(
                      'Choose A Category',
                      style: 
                      GoogleFonts.kanit
                      (
                        fontSize: 40,
                        color: Colors.white
                      ),
                    ),
                    // const Icon(Icons.gamepad_outlined,color: Color.fromARGB(255, 177, 96, 209),)
                ],
              ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 80, //height of button
                  width: 200, //width of button
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          //to set border radius to button
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(
                          context, '/HangmanBoard');
                          Data.cc = Data.animals;
                    },
                    child: const Text(
                      'Animals',
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
                  height: 80, //height of button
                  width: 200, //width of button
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          //to set border radius to button
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(
                          context, '/HangmanBoard'); 
                          Data.cc = Data.sports;
                    },
                    child: const Text(
                      'Sports',
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
                  height: 80, //height of button
                  width: 200, //width of button
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          //to set border radius to button
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(
                          context, '/HangmanBoard'); 
                          Data.cc = Data.countries;
                    },
                    child: const Text(
                      'Countries',
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
