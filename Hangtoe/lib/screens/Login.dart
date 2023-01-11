import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/user_service.dart';

class Login extends ConsumerStatefulWidget {
  const Login({super.key});
  @override
  ConsumerState<Login> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
                  controller: _emailController,
                  validator: (val) {
                    if (val != null && val.isNotEmpty) {
                      return null;
                    } else {
                      return 'Please enter your email';
                    }
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Email',
                    hintStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(Icons.person, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 50),
                TextFormField(
                  controller: _passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a password';
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(Icons.lock, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20),
                ButtonBar(
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          UserHelper().signIn(ref, context, _emailController,
                              _passwordController);
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
}
