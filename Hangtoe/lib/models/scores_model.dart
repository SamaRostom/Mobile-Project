import 'package:flutter_application_1/data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Scoresmodel{
  //'Rank': 1, 'Name': 'Player', 'Date': '22-Mar-31', 'Score': 7
  int? rankid;
  int? rank;
  String? playername;
//   var newFormat = DateFormat("yy-MM-dd");
// String updatedDt = newFormat.format(date);
  String? date;
  int? score;
  String? typeofgame;

  Scoresmodel({this.rankid,this.rank,this.playername,this.date,this.score,this.typeofgame});

  // List<DataRow> createRow() {
  //   var rank = Data.topRanks;
  //   List<Map> S;
  //   Data.chosed == 'hangman'? S=Data.Hangscore:S=Data.xoscore;
  //   return S
  //       .map((book) => DataRow(cells: [
  //             DataCell(Text(book['Rank']-1 < 3 ? rank[book['Rank']-1] + book['Rank'].toString():book['Rank'].toString(), style: GoogleFonts.kanit(fontSize: 20,color: Colors.white),)),
  //             DataCell(Text(book['Name'],style: GoogleFonts.kanit(fontSize: 20,color: Colors.white),)),
  //             DataCell(Text(book['Date'],style: GoogleFonts.kanit(fontSize: 20,color: Colors.white),)),
  //             DataCell(Text('     ${book['Score']}',style: GoogleFonts.kanit(fontSize: 20,color: Colors.white),))
  //           ]))
  //       .toList();
  // }
}