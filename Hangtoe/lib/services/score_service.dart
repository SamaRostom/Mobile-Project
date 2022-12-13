import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/screens/scores.dart';
import '../models/scores_model.dart';
import '../constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data.dart';

//https://github.com/ahmedserag2/E-Commerce/tree/main/lib
//https://www.freecodespot.com/blog/crud-in-flutter-using-firebase/
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _Collection = _firestore.collection('Scores');
class Response{
  int? code;
  String? message;
  Response({this.code,this.message});
}
class FirebaseCrud {
//CRUD method here
  static Future<Response> addScore({
    required int rank,
    required String playername,
    required String date,
    required int score,
    required String typeofgame,
  }) async {

    Response response = Response();
    String a;
    
    // _firestore.collection("UsersTodos").doc(username).update({
    //     'userTodo': FieldValue.arrayUnion([_todoController.text]),
    // });
    DocumentReference documentReferencer =
        _Collection.doc();

    Map<String, dynamic> data = <String, dynamic>{
      "rank": rank,
      "player_name": playername,
      "date": date,
      "score" : score,
      "typeofgame": typeofgame,
    };

    var result = _Collection.add(data).then((DocumentReference doc) => print('DocumentSnapshot added with ID: ${doc.id}'));
    
    // var result = await documentReferencer
    //     .set(data)
    //     .whenComplete(() {
    //       response.code = 200;
    //       response.message = "Sucessfully added to the database";
    //       // constants._showMyDialog(context, "Sucessfully added to the database");
    //       // DialogExample("Sucessfully added to the database");
    //     })
    //     .catchError((e) {
    //         response.code = 500;
    //         response.message = e;
    //         // DialogExample(e);
    //     });
    // return null;

        return response;
  }
  static Stream<QuerySnapshot> readScore() {
    CollectionReference notesItemCollection =
        _Collection;

    // _Collection.get().then((event) {
    //   for (var doc in event.docs) {
    //     print("${doc.id} => ${doc.data()}");
    //   }
    // });    

    return notesItemCollection.snapshots();
  }
  // getDataFromDatabase() async {
  //   var value = FirebaseDatabase.instance.reference();
  //   var getValue = await value.child('Scores').once();
  //   return getValue;
  // }
  static Future<Scoresmodel?> updatescore({
    required int rank,
    required String playername,
    required DateTime date,
    required int score,
    required String typeofgame,
    required String docId,
  }) async {
    // Response response = Response();
    DocumentReference documentReferencer =
        _Collection.doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "rank": rank,
      "player_name": playername,
      "date": date,
      "score" : score,
      "typeofgame": typeofgame,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() {
          //  response.code = 200;
          // response.message = "Sucessfully updated Employee";
          DialogExample("Sucessfully updated score");
        })
        .catchError((e) {
            // response.code = 500;
            // response.message = e;
            DialogExample(e);
        });

        return null;
  }
    static Future<Scoresmodel?> deleteEmployee({
    required String docId,
  }) async {
    //  Response response = Response();
    DocumentReference documentReferencer =
        _Collection.doc(docId);

    await documentReferencer
        .delete()
        .whenComplete((){
          // response.code = 200;
          // response.message = "Sucessfully Deleted Employee";
          DialogExample("Sucessfully deleted score");
        })
        .catchError((e) {
          //  response.code = 500;
          //   response.message = e;
          DialogExample(e);
        });

   return null;
  }


//   //flutter firebase read data table? 
//   static Future<List<Scores>> _getEventsFromFirestore() async {
// // CollectionReference ref = Firestore.instance.collection('events');
// QuerySnapshot eventsQuery = await _Collection
//     .where("typeofgame", isEqualTo: "hangman")
//     .getDocuments();

// Map<String, Scoresmodel> eventsHashMap = <String, Scoresmodel>{};

// eventsQuery.documents.forEach((document) {
//   eventsHashMap.putIfAbsent(document['id'], () =>  Scoresmodel(
//       // name: document['name'],
//       // time: document['time'],
//       // description: document['description'],
//       // url: document['event_url'],
//       // photoUrl: _getEventPhotoUrl(document['group']),
//       // latLng: _getLatLng(document)));
//       rank: document['rank'],
//       playername: document['playername'],
//       date: document['date'],
//       score : document['score'],
//       typeofgame: document['typeofgame']));     
// });

// return eventsHashMap;
// }
}
 



