import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Utils/validations.dart';
import '../services/user_service.dart';

class Signup extends ConsumerStatefulWidget {
  const Signup({super.key});

  @override
  ConsumerState<Signup> createState() => _SignupState();
}

class _SignupState extends ConsumerState<Signup> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
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
          Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset('assets/Signup.png', width: 200),
                const SizedBox(height: 20),
                //username
                TextFormField(
                  autofocus: true,
                  controller: _nameController,
                  validator: (val) {
                    if (val != null && isName(val)) {
                      return null;
                    } else {
                      return 'Please enter a valid username';
                    }
                  },
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Username',
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20),
                //email
                TextFormField(
                  autofocus: true,
                  controller: _emailController,
                  validator: (val) {
                    if (val != null && isEmail(val)) {
                      return null;
                    } else {
                      return 'Please enter a valid email';
                    }
                  },
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Email',
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20),

                //password
                TextFormField(
                  autofocus: true,
                  controller: _passwordController,
                  validator: (val) {
                    if (val != null && isPassword(val)) {
                      return null;
                    } else {
                      return 'Please enter At Least 8 characters one letter and one number';
                    }
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20),
                ButtonBar(
                  children: <Widget>[
                    //signup button
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Navigator.pushNamed(context, '/Login');
                          UserService().signUp(ref, context, _nameController,
                              _emailController, _passwordController);
                        }
                        // Navigator.pushNamed(context, '/Login');
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
          ),
          const SizedBox(height: 20),
          Row(
            // ignore: sort_child_properties_last
            children: <Widget>[
              const Text('Already have an account?'),
              TextButton(
                child: const Text(
                  'Sign in',
                  style: TextStyle(
                      fontSize: 20,
                      decoration: TextDecoration.underline,
                      color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/Login');
                },
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ],
      ),
    );
  }
}
