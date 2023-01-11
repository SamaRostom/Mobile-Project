import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user_model.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../Utils/constants.dart';
import '../Utils/data.dart' as val;
import '../widgets/loading_widget.dart';

class UserHelper{
  static saveUser(User user) async {
    //Dont Put Instance common as it doesnt change when the user logs out
    final FirebaseFirestore db = FirebaseFirestore.instance;
    final user = FirebaseAuth.instance.currentUser!;

    Map<String, dynamic> userData = {
      "email": user.email,
      "username":"eeee",
      "password":"Eee1111",
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
              return  const LoadingWidget();
              // Center(
              //   child: LoadingAnimationWidget.inkDrop(
              //     color: Colors.white, size: 100,
              // ));
              
              // Center(
              //     child: CircularProgressIndicator(
              //   backgroundColor: Colors.black26,
              //   valueColor: AlwaysStoppedAnimation<Color>(
              //       Color.fromARGB(255, 205, 153, 51)),
              // ));
              
            });
        
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
        final FirebaseFirestore db = FirebaseFirestore.instance;
        final user = FirebaseAuth.instance.currentUser!;

        Map<String, dynamic> userData = {
          "email": emailController.text.trim(),
          "username":nameController.text.trim(),
          "password":passwordController.text.trim(),
        };
        final userRef = db.collection("Users").doc(user.uid);
        if ((await userRef.get()).exists) {
        } else {
          await userRef.set(userData);
        }

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
  
  // postDetailsToFirestore() async {
  //   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  //   User? user = FirebaseAuth.instance.currentUser;

  //   UserModel userModel = UserModel(user.username,user.email);

  //   await firebaseFirestore
  //       .collection("users")
  //       .doc(user.uid)
  //       .set(userModel.toMap(userModel));
  // }

  // function() async{

  // }

//   void addNickname({required nickname, nickname2}) async {
//   final docName = FirebaseFirestore.instance.collection('Users').doc();

//    final scoree = UserModel(rankid : docName.id,);

//   final json = scoree.toJson();

//   await docName.set(json);
// }
}