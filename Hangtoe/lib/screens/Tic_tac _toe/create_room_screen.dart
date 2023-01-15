import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/custom_button.dart';
import 'package:flutter_application_1/widgets/custom_text.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateRoomScreen extends StatefulWidget {
  static const routeName = "/createroom-screen";
  const CreateRoomScreen({Key? key}) : super(key: key);

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreen();
}

class _CreateRoomScreen extends State<CreateRoomScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const <Widget>[
                CustomText(
                  shadows: [
                    Shadow(
                      blurRadius: 40,
                      color: Color.fromARGB(255, 208, 211, 213),
                    ),
                  ],
                  text: 'Create Room',
                  fontSize: 60,
                ),
                SizedBox(
                  height: 100,
                ),
                TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    focusColor: Colors.white,
                    hoverColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.white),
                    ),
                    hintText: 'Enter your nickname',
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
              ],
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
                onPressed: () {},
                child: Text('Create',
                    style: GoogleFonts.patrickHand(
                      fontSize: 25,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
