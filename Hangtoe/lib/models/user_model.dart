import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String username;
  // String? nickname;
  // String? nickname2;
  String email;
  int score;
  // String password;
  UserModel(this.username, this.email, this.score);
  int compareTofunction(UserModel user) => username.compareTo(user.username);

  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    return UserModel(snapshot.get('username'), snapshot.get('email'), snapshot.get('score'));
  }
}