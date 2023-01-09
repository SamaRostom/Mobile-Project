import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utils/data.dart';
import 'package:flutter_application_1/widgets/loading_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/score_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/scores_model.dart';
// import 'data.dart';


class Scores extends StatefulWidget {
  const Scores({super.key});

  @override
  ScoresState createState() => ScoresState();
}

class ScoresState extends State<Scores>{

  // var S;
  // Data.chosed == "hangman"?
  // var S=Data.Hangscore;:var S=Data.xoscore;
  // Data.chosed == 'hangman'? S=Data.Hangscore:S=Data.xoscore;
  // if(Data.chosed == "hangman"){
    
  // }
  // final Stream<QuerySnapshot> collectionReference = FirebaseCrud.readScore();
  // List<DataRow> createRow() {
  //   var rank = Data.topRanks;
  //   // List<Scoresmodel> Scores = [];
  //   // List<Map> S;
  //   // Scoresmodel.typeofgame == 'hangman'? S=Data.Hangscore:S=Data.xoscore;
  //   // return S
  //   //     .map((book) => DataRow(cells: [
  //   //           DataCell(Text(book['rank']-1 < 3 ? rank[book['rank']-1] + book['rank'].toString():book['rank'].toString(), style: GoogleFonts.kanit(fontSize: 20,color: Colors.white),)),
  //   //           DataCell(Text(book['name'],style: GoogleFonts.kanit(fontSize: 20,color: Colors.white),)),
  //   //           DataCell(Text(book['date'],style: GoogleFonts.kanit(fontSize: 20,color: Colors.white),)),
  //   //           DataCell(Text('     ${book['score']}',style: GoogleFonts.kanit(fontSize: 20,color: Colors.white),))
  //   //         ]))
  //   //     .toList();
    
  //   Map? d= Scoresmodel.setmap();
  //   // List<Map> S=d as List<Map>;
  //   List<Map> S;
  //   Data.chosed == 'hangman'? S=Data.Hangscore:S=Data.xoscore;
    
  //   return S
  //       .map((book) => DataRow(cells: [
  //             DataCell(Text(book['rank']-1 < 3 ? rank[book['rank']-1] + book['rank'].toString():book['rank'].toString(), style: GoogleFonts.kanit(fontSize: 20,color: Colors.white),)),
  //             DataCell(Text(book['player_name'],style: GoogleFonts.kanit(fontSize: 20,color: Colors.white),)),
  //             DataCell(Text(book['date'],style: GoogleFonts.kanit(fontSize: 20,color: Colors.white),)),
  //             DataCell(Text('     ${book['score']}',style: GoogleFonts.kanit(fontSize: 20,color: Colors.white),))
  //           ]))
  //       .toList();
  // }

   List<DataRow> _createRows(QuerySnapshot snapshot) {
    var rank = Data.topRanks;
    List<DataRow> newScore = snapshot.docs.map((DocumentSnapshot documentSnapshot) => DataRow(cells: [
              DataCell(Text((documentSnapshot['rank'])-1 < 3 ? rank[documentSnapshot['rank']-1] + documentSnapshot['rank'].toString():documentSnapshot['rank'].toString(), style: GoogleFonts.kanit(fontSize: 20,color: Colors.white),)),
              DataCell(Text(documentSnapshot['player_name'],style: GoogleFonts.kanit(fontSize: 20,color: Colors.white),)),
              DataCell(Text(documentSnapshot['date'],style: GoogleFonts.kanit(fontSize: 20,color: Colors.white),)),
              DataCell(Text('     ${documentSnapshot['score']}',style: GoogleFonts.kanit(fontSize: 20,color: Colors.white),))
            ]))
        .toList();

    return newScore;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Scores').where('typeofgame', isEqualTo:Data.chosed).snapshots(),
          builder: (context, snapshot) {
            if(snapshot.hasData){
              final allScores = snapshot.data!;
              return Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                // mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        color: Colors.white,
                        onPressed: () {Navigator.pop(context); },
                      ),
                      // ListView(
                      //   // padding: const EdgeInsets.all(0),
                      //   children: [
                          Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children:  [
                          Text(
                            'High Scores',
                            textAlign: TextAlign.center,
                            style:
                            GoogleFonts.patrickHand
                            (
                              fontSize: 60,
                              color: Colors.white
                            ),   
                            // TextStyle(
                            //   fontSize: 50,
                            //   color: Colors.white,
                            // ),
                          ),
                        ]),
                      //   ]
                      // ),
                    
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      DataTable(
                        columnSpacing: 25,
                        columns: [
                          DataColumn(
                            label: Text('Rank',style: GoogleFonts.patrickHand
                            (
                              fontSize: 25,
                              color: Colors.white
                            ),),
                          ),
                          DataColumn(
                            label: Text('Name',style: GoogleFonts.patrickHand
                            (
                              fontSize: 25,
                              color: Colors.white
                            ),),
                          ),
                          DataColumn(
                            label: Text('   Date',style: GoogleFonts.patrickHand
                            (
                              fontSize: 25,
                              color: Colors.white
                            ),),
                          ),
                          DataColumn(
                            label: Text('Score',style: GoogleFonts.patrickHand
                            (
                              fontSize: 25,
                              color: Colors.white
                            ),),
                          ),
                        ], 
                        rows: _createRows(allScores),
          
                            //  DataRow(cells: [
                            //     DataCell(Text('1')),
                            //     DataCell(Text('Arshik')),
                            //     DataCell(Text('5644645')),
                            //     DataCell(Text('3')),
                            //  ])
                            // for (var item in Data.scoreslist) {
                            //     // print(item);
                            //     Set<DataRow>(cells: [
                            //     DataCell(item[1][1]),
                            //     DataCell(Text('Arshik')),
                            //     DataCell(Text('5644645')),
                            //     DataCell(Text('3')),
                            //  ])
                            // }
          
          
                        )  
                    ],
                  ),
                ],
                
              );
            }
            else {
              return const LoadingWidget();
              // Center(
              //   child: CircularProgressIndicator(),
              // );
            }
          }
        ),
      ),
    );
  }
}







