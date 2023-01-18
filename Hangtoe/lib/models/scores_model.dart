import 'dart:convert';

enum Typeofgame { hangman, tic }

List<Scoresmodel> userFromJson(String str) => List<Scoresmodel>.from(
    json.decode(str).map((x) => Scoresmodel.fromJson(x)));

String userToJson(List<Scoresmodel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Scoresmodel {
  Scoresmodel(
      {required this.rankid,
      required this.rank,
      required this.playername,
      required this.date,
      required this.score,
      required this.typeofgame});

  //'Rank': 1, 'Name': 'Player', 'Date': '22-Mar-31', 'Score': 7
  String rankid;
  int rank;
  String playername;
  String date;
  int score;
  Typeofgame typeofgame;

  factory Scoresmodel.fromJson(Map<String, dynamic> json) => Scoresmodel(
        rankid: json['rankid'],
        rank: json['rank'],
        playername: json['playername'],
        date: json['date'],
        score: json['score'],
        typeofgame: json['typeofgame'],
      );

  Map<String, dynamic> toJson() => {
        "rankid": rankid,
        "rank": rank,
        "playername": playername,
        "date": date,
        "score": score,
        "typeofgame": typeofgame,
      };
}
