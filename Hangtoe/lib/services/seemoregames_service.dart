import 'package:flutter/material.dart';
import '../models/seemoregames_model.dart';
import 'package:http/http.dart' as http;

class SeeMoreGamesService{
  getData() async{
    var client = http.Client();

    var uri = Uri.parse("https://www.freetogame.com/api/games");
    var response = await client.get(uri);

    if(response.statusCode == 200){
      String jsonString = response.body;
      return seeMoreGamesModelFromJson(jsonString);
    }
  }
}