import 'package:flutter/material.dart';
import 'package:flutter_application_1/data.dart';

Widget letter(String character, bool hidden) {
  return Container(
    height: 65,
    width: 50,
    // ignore: prefer_const_constructors
    padding: EdgeInsets.all(12.0),
    decoration: BoxDecoration(
      color: Data.primaryColorDark,
      borderRadius: BorderRadius.circular(4.0),
    ),
    child: Visibility(
      visible: !hidden,
      child: Text(
        character,
        // ignore: prefer_const_constructors
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 40.0,
        ),
      ),
    ),
  );
}
