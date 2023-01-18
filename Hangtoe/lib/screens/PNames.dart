import 'package:flutter/material.dart';
// import 'package:flutter_application_1/Utils/data.dart';
import 'package:flutter_application_1/screens/Hangman/type_word_screen.dart';
import 'package:flutter_application_1/screens/Tic_tac%20_toe/twoplayers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../providers/score_provider.dart';
import '../providers/user_provider.dart';

class PName extends ConsumerStatefulWidget {
  static const routeName = "/pname-screen";

  const PName({super.key});

  @override
  // ignore: library_private_types_in_public_api
  ConsumerState<PName> createState() => _PNameState();
}

class _PNameState extends ConsumerState<PName> {
  final _formKey = GlobalKey<FormState>();
  final _play1Controller = TextEditingController();
  final _play2Controller = TextEditingController();
  final _playController = TextEditingController();

  @override
  void dispose() {
    _play1Controller.dispose();
    _play2Controller.dispose();
    _playController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        body: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              color: Colors.white,
              onPressed: () {
                Navigator.of(context).pop();
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
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    autofocus: true,
                    controller: _play1Controller,
                    validator: (val) {
                      if (val!.isNotEmpty) {
                        return null;
                      } else {
                        return 'Please enter a nickname for player 1';
                      }
                    },
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      focusColor: Colors.white,
                      hoverColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.white),
                      ),
                      hintText: 'Enter 1 Player Name',
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    autofocus: true,
                    controller: _play2Controller,
                    validator: (val) {
                      if (val!.isNotEmpty) {
                        return null;
                      } else {
                        return 'Please enter a nickname for player 2';
                      }
                    },
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.white),
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
                        if (_formKey.currentState!.validate()) {
                          ref.read(nickname1Proivder.notifier).state =
                              _play1Controller.text;
                          ref.read(nickname2Proivder.notifier).state =
                              _play2Controller.text;
                          if (ref.watch(typeofgameProivder) == "hangman") {
                            Navigator.pushNamed(
                                context, TypeWordScreen.routeName);
                          } else {
                            Navigator.pushNamed(context, Twoplayers.routeName);
                          }
                        }
                      },
                      child: Text('Play',
                          style: GoogleFonts.patrickHand(
                            fontSize: 25,
                          )),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
