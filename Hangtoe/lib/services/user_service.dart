import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Utils/constants.dart';
import '../Utils/data.dart' as val;

class UserHelper{
  static saveUser(User user) async {
    //Dont Put Instance common as it doesnt change when the user logs out
    final FirebaseFirestore db = FirebaseFirestore.instance;
    final user = FirebaseAuth.instance.currentUser!;

    Map<String, dynamic> userData = {
      "email": user.email,
      "username":"sama",
      "password":"SAMA1212",
    };
    final userRef = db.collection("Users").doc(user.uid);
    if ((await userRef.get()).exists) {
      // To Update Anything in the User
    } else {
      await userRef.set(userData);
    }
  }
  
  //Register Page
  Future signUp(BuildContext context, TextEditingController nameController,TextEditingController emailController,
      TextEditingController passwordController) async {
      try {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return const Center(
                  child: CircularProgressIndicator(
                backgroundColor: Colors.black26,
                valueColor: AlwaysStoppedAnimation<Color>(
                    Color.fromARGB(255, 205, 153, 51)),
              ));
            });
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        Navigator.of(context).pushNamed('/Login');
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          Navigator.of(context).pop();
          errormessage("Error!", "The password provided is too weak.");
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(val.snackBar);
        } else if (e.code == 'email-already-in-use') {
          Navigator.of(context).pop();
          errormessage("Error!", "The account already exists for that email.");
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(val.snackBar);
        }
      } catch (e) {
        print(e);
      }
  }

  Future<DocumentSnapshot> getNewUserData() async {
    final user = FirebaseAuth.instance.currentUser!;
    String id = user.uid;
    return FirebaseFirestore.instance.collection('Users').doc(id).get();
  }
}