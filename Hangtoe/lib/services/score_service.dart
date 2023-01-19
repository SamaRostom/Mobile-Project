import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/score_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../Utils/data.dart';
import '../Utils/size_config.dart';
import '../models/scores_model.dart';
import '../providers/user_provider.dart';



class ScoreService{
  void createScore({required rank, required playername, required date, required score, required typeofgame}) async {
  final docScore = FirebaseFirestore.instance.collection('Scores').doc();

   final scoree = Scoresmodel(rankid : docScore.id, rank: rank, playername: playername, date: date, score: score, typeofgame: typeofgame);

  final json = scoree.toJson();

  await docScore.set(json);
}

Stream<List<Scoresmodel>> readScores() {
  return FirebaseFirestore.instance.collection('Scores').snapshots().map(
      (snapshot) =>
          snapshot.docs.map((doc) => Scoresmodel.fromJson(doc.data())).toList());
}

Future<void> delete(String id) async {
  await FirebaseFirestore.instance.collection('Scores').doc(id).delete();
}

  static saveScore(WidgetRef ref) async {
    final FirebaseFirestore db = FirebaseFirestore.instance;
    final score = FirebaseAuth.instance.currentUser!;
    final tog = ref.watch(typeofgameProivder);
    final scoreProvider = ref.watch(scoreProivder);
    final  finalScoreUserRef = await db.collection("Scores").where("email", isEqualTo: score.email).where("typeofgame", isEqualTo: tog).get();
    final scoreCollection = db.collection("Scores").doc();
    Map<String, dynamic> userData = {
      "email": score.email,
      "score": scoreProvider,
      "date": DateTime.now(),
      "typeofgame": tog,
    };
    if (finalScoreUserRef.docs.isEmpty) {
      await scoreCollection.set(userData);
    } else {
      if(finalScoreUserRef.docs.first.get('score') < scoreProvider){
        finalScoreUserRef.docs.first.reference.update(userData);
      }
    }
  }

   static int r = 1;
  static var rank = Data.topRanks;
  static String? rr;
   static String? rankdata() {
    (r) <= 3 ? rr = rank[r - 1] + r.toString() : rr = r.toString();
    r++;
    return rr;
  }

  static List<DataRow> createRows(WidgetRef ref,QuerySnapshot snapshot) {
    List<DataRow> newScore = snapshot.docs
        .map((DocumentSnapshot documentSnapshot) => DataRow(
                color: MaterialStateColor.resolveWith((states) {
                  if (Data.loggedin &&
                      documentSnapshot['email'] ==
                          ref.watch(newUserDataProivder)!.email) {
                    return Colors.cyan;
                  } else {
                    return Colors.transparent;
                  }
                }),
                cells: [
                  DataCell(Text(
                    rankdata() ?? "0",
                    style: GoogleFonts.kanit(
                        fontSize: getProportionateScreenWidth(15),
                        color: Colors.white),
                  )),
                  DataCell(Text(
                    documentSnapshot['email'],
                    style: GoogleFonts.kanit(
                        fontSize: getProportionateScreenWidth(15),
                        color: Colors.white),
                  )),
                  DataCell(Text(
                    "    ${DateFormat('yyyy-MM-dd').format((documentSnapshot['date'] as Timestamp).toDate())}",
                    style: GoogleFonts.kanit(
                        fontSize: getProportionateScreenWidth(15),
                        color: Colors.white),
                  )),
                  DataCell(Text(
                    '      ${documentSnapshot['score']}',
                    style: GoogleFonts.kanit(
                        fontSize: getProportionateScreenWidth(15),
                        color: Colors.white),
                  ))
                ]))
        .toList();
    return newScore;
  }

}

