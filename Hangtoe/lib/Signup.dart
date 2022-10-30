import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_application_1/data.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 150,
              ),
              Text(
                'Signup',
                style:
                    GoogleFonts.patrickHand(fontSize: 75, color: Colors.white),
              ),
            ],
          ),
          Column(
            children: [
              Image.asset('assets/Signup.png', width: 200),
              const SizedBox(height: 50),
              const TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Username',
                ),
              ),
              const SizedBox(height: 50),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Password',
                ),
              ),
              const SizedBox(height: 20),
              ButtonBar(
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/Login');
                    },
                    child: const Text('Signup'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/');
                    },
                    child: const Text('Cancel'),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
