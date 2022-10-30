// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/data.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/letter.dart';
import 'package:flutter_application_1/figure_image.dart';
// import 'package:flutter_application_1/drawing.dart';

class Tictactoe extends StatefulWidget {
  const Tictactoe({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TictactoeState createState() => _TictactoeState();
}

class _TictactoeState extends State<Tictactoe> {
  String lastvalue = "X";
   @override
   Widget build (BuildContext context){
    return Scaffold(
      body: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        crossAxisAlignment:CrossAxisAlignment.center,
        children:[
          Text(
            "It's $lastvalue turn".toUpperCase(),
            style: TextStyle(
              color:Colors.white,
              fontSize:58,
            ),
          ),
        ],

      )
    );
   }
}
