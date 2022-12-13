import 'package:flutter/material.dart';
import 'package:flutter_application_1/data.dart';
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
  final Stream<QuerySnapshot> collectionReference = FirebaseCrud.readScore();
  List<DataRow> createRow() {
    var rank = Data.topRanks;
    List<Map> S;
    Data.chosed == 'hangman'? S=Data.Hangscore:S=Data.xoscore;
    return S
        .map((book) => DataRow(cells: [
              DataCell(Text(book['Rank']-1 < 3 ? rank[book['Rank']-1] + book['Rank'].toString():book['Rank'].toString(), style: GoogleFonts.kanit(fontSize: 20,color: Colors.white),)),
              DataCell(Text(book['Name'],style: GoogleFonts.kanit(fontSize: 20,color: Colors.white),)),
              DataCell(Text(book['Date'],style: GoogleFonts.kanit(fontSize: 20,color: Colors.white),)),
              DataCell(Text('     ${book['Score']}',style: GoogleFonts.kanit(fontSize: 20,color: Colors.white),))
            ]))
        .toList();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
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
                  rows: createRow(),

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
          
        ),
      ),
    );
  }
}







