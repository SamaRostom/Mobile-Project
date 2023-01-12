import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Utils/constants.dart';
import '../Utils/data.dart' as val;
import '../Utils/data.dart';
import '../providers/user_provider.dart';
import '../widgets/loading_widget.dart';

class UserService {
  //Register Page
  Future signUp(WidgetRef ref,BuildContext context, TextEditingController nameController, TextEditingController emailController,
      TextEditingController passwordController) async {
      try {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return const Center(
                child: LoadingWidget(),
              );
            });
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
        UserService.saveUser(nameController.text);
        UserService().getNewUserData().then((value) {
            UserModel user = UserModel.fromSnapshot(value);
              ref.read(newUserDataProivder.notifier).state = user;
              Navigator.of(context).pushNamed('/');
          });
        Navigator.of(context).pushNamed('/Login');
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          Navigator.of(context).pop();
          error("Error!", "The password provided is too weak.");
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(val.snackBar);
        } else if (e.code == 'email-already-in-use') {
          Navigator.of(context).pop();
          error("Error!", "The account already exists for that email.");
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(val.snackBar);
        }
      } catch (e) {
        print(e);
      }
  }

  Future signIn(
      WidgetRef ref,
      BuildContext context,
      TextEditingController emailController,
      TextEditingController passwordController) async {
    try {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return const Center(
              child: LoadingWidget(),
            );
          });

      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      UserService().getNewUserData().then((value) {
        UserModel user = UserModel.fromSnapshot(value);
        ref.read(newUserDataProivder.notifier).state = user;
        Data.loggedin = true;
        Navigator.pushNamed(context, '/');
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
          Navigator.of(context).pop();
          error("Error!", "No user found for that email.");
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(val.snackBar);
        } else if (e.code == 'wrong-password') {
          Navigator.of(context).pop();
          error("Error!", "Wrong password provided for that user.");
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(val.snackBar);
        }
    }
  }

  static saveUser(String username) async {
    //Dont Put Instance common as it doesnt change when the user logs out
    final FirebaseFirestore db = FirebaseFirestore.instance;
    final user = FirebaseAuth.instance.currentUser!;

    Map<String, dynamic> userData = {
      "email": user.email,
      "score": 0,
      "username":username,
    };
    final userRef = db.collection("Users").doc(user.uid);
    if ((await userRef.get()).exists) {
      // To Update Anything in the User
    } else {
      await userRef.set(userData);
    }
  }

  Future<DocumentSnapshot> getNewUserData() async {
    final user = FirebaseAuth.instance.currentUser!;
    String id = user.uid;
    return FirebaseFirestore.instance.collection('Users').doc(id).get();
  }

  static logOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Data.loggedin = false;
    Navigator.of(context).pushReplacementNamed('/Login');
  }

  static void updateScore(WidgetRef ref) async {
    String data = '';
    String email = ref.watch(newUserDataProivder)!.email;
    int score = ref.watch(newUserDataProivder)!.score;
    await FirebaseFirestore.instance
        .collection('Users')
        .where("email", isEqualTo: email)
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        data = (doc.reference.path);
      }
    });

    final update = FirebaseFirestore.instance.doc(data);
    update.update({"score": score});
  }
}


