import 'package:flutter/material.dart';
// import 'package:flutter/Home.dart';
// import 'dart:ui';
import 'package:flutter_application_1/Home.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
      // initialRoute: '/',
      // routes: {
      //   // '/': (context) => const HomeScreen(),
      //   // '/details': (context) => const DetailScreen(),
      //   // '/third': (context) => const ThirdScreen(),
      // },
    );
  }
}

