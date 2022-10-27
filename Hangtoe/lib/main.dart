import 'package:flutter/material.dart';
// import 'dart:ui';

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
      home: const MyHomeScreen(),
    );
  }
}

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          // mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.account_circle, size: 50),
                Column(children: const [
                  Text(
                    'Flutter McFlutter',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    'Experienced App Developer',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ])
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: const [
                Text(
                  '123 Main Street',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  '(415) 555-0198',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: const [
                Icon(Icons.accessibility, size: 50),
                Icon(Icons.timer, size: 50),
                Icon(Icons.phone_android, size: 50),
                Icon(Icons.phone_iphone, size: 50)
              ],
            )
          ],
        ),
      ),
    );
  }
}
