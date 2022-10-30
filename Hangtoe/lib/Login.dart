import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_application_1/data.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const SizedBox(
                height: 100,
              ),
              Text(
                'Login',
                style:
                    GoogleFonts.patrickHand(fontSize: 75, color: Colors.white),
              ),
            ],
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset('assets/Login.png', width: 250),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter the Username',
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                  autofocus: true,
                  validator: (val) {
                    if (val != null && val.isNotEmpty) {
                      return null;
                    } else {
                      return 'Please enter a username';
                    }
                  },
                ),
                const SizedBox(height: 50),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter the Password',
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                  autofocus: true,
                  validator: (val) {
                    if (val != null && val.isNotEmpty) {
                      return null;
                    } else {
                      return 'Please enter a password';
                    }
                  },
                ),
                const SizedBox(height: 20),
                ButtonBar(
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/');
                      },
                      child: const Text('Login'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/Login');
                      },
                      child: const Text('Cancel'),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
