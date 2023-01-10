import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_application_1/main.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_application_1/data.dart';
// import 'package:firebase_core/firebase_core.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // final usernameController = TextEditingController();
  // final passwordController = TextEditingController();

  // @override
  // void dispose() {
  //   usernameController.dispose();
  //   passwordController.dispose();

  //   super.dispose();
  // }

  // final user = FirebaseAuth.instance.currentUser!;
  // String userId = User.uid;

  //key for form
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
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
                  // controller: usernameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Username',
                    hintStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(Icons.mail, color: Colors.white),
                  ),
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
                  // controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(Icons.lock, color: Colors.white),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a password';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 20),
                ButtonBar(
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushNamed(context, '/');
                        }
                      },
                      child: const Text('Login'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/');
                      },
                      child: const Text('Cancel'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  //*********************************SIGN IN************************************/
  Future logIn({required String username, required String password}) async {
    final User? user = (await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: username.trim(),
      password: password.trim(),
    ))
        .user;

    // if (user != null) {
    //   userId = user.uid;
    // }
  }
}
