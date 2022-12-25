import 'dart:convert';

enum Typeofgame{hangman,tic}
List<Scoresmodel> userFromJson(String str) =>
    List<Scoresmodel>.from(json.decode(str).map((x) => Scoresmodel.fromJson(x)));

String userToJson(List<Scoresmodel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Scoresmodel{

  Scoresmodel({
    required this.rankid,
    required this.rank,
    required this.playername,
    required this.date,
    required this.score, 
    required this.typeofgame
  });

  //'Rank': 1, 'Name': 'Player', 'Date': '22-Mar-31', 'Score': 7
  String rankid;
  int rank;
  String playername;
//   var newFormat = DateFormat("yy-MM-dd");
// String updatedDt = newFormat.format(date);
  String date;
  int score;
  Typeofgame typeofgame;
  // Map? ma;

  

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

  // Map<String, dynamic> toMap(){
  //   return {
  //     "rank": rank,
  //     "player_name": playername,
  //     "date": date,
  //     "score" : score,
  //     "typeofgame": typeofgame,
  //   };
  // }
  // static Map? setmap(){
  //   Map? d = FirebaseCrud.getScores();
  //   // ma=d;
  //   return d;
  // }

  // factory Scoresmodel.fromJson(Map<String, dynamic> json) {
  //     return Scoresmodel(
  //       rank: json['rank'],
  //       playername: json['playername'],
  //       date: json['date'],
  //       score: json['score'],
  //       typeofgame: json['typeofgame'],
  //     );
  // }

  factory Scoresmodel.fromJson(Map<String, dynamic> json) => Scoresmodel(
        rankid: json['rankid'],
        rank: json['rank'],
        playername: json['playername'],
        date: json['date'],
        score: json['score'],
        typeofgame: json['typeofgame'],
      );

  // Scoresmodel.fromMap(Map<String, dynamic> map)
  //   : assert(map['rank'] != null),
  //   assert(map['playername'] != null),
  //   assert(map['date'] != null),
  //   rank = map['rank'],
  //   playername = map['playername'],
  //   date = map['date'],
  //   score = map['score'],
  //   typeofgame = map['typeofgame'] == 'hangman' ? Typeofgame.hangman : Typeofgame.tic;

  Map<String, dynamic> toJson() => {
        "rankid": rankid,
        "rank": rank,
        "playername": playername,
        "date": date,
        "score": score,
        "typeofgame": typeofgame,
      };
}