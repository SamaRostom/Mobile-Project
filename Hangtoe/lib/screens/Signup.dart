import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_application_1/Utils/data.dart';
import '../Utils/validations.dart';
import '../models/user_model.dart';
import '../providers/user_provider.dart';
import '../services/user_service.dart';

class Signup extends ConsumerStatefulWidget {
  const Signup({super.key});

  @override
  // ignore: library_private_types_in_public_api
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

  //byd5al el 7aga fel firebas bas mesh byro7 3ala page login
  void redirectToLogin() {
    final user = FirebaseAuth.instance.currentUser!;
    UserHelper.saveUser(user);
    //Salah Way
    // Future userData = UserHelper().getUserData();
    // ref.read(userDataProviderRepository.notifier).state = userData;
    // Navigator.of(context).pushNamed('/home');

    UserHelper().getNewUserData().then((value) {
      UserModel user = UserModel.fromSnapshot(value);
      ref.read(newUserDataProivder.notifier).state = user;
      Navigator.of(context).pushReplacementNamed('/Login');
    });
  }


  @override
  Widget build(BuildContext context) {
    // final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey =  GlobalKey<ScaffoldState>();
    return Scaffold(
      key:_scaffoldKey,
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
                    if (val != null && isPassword(val) ) {
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
                          // UserHelper().signUp(
                          //       context, _nameController, _emailController, _passwordController);
                          redirectToLogin();      
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
          )
        ],
      ),
    );
  }
}
