import 'package:flutter/material.dart';


// ignore: camel_case_types
class scores extends StatefulWidget {
  const scores({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _scoresState createState() => _scoresState();
}

// ignore: camel_case_types
class _scoresState extends State<scores>{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          // mainAxisSize: MainAxisSize.max,
          children: [
            Row(
             
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  color: Colors.white,
                  onPressed: () {Navigator.pop(context); },
                ),
                const Icon(Icons.account_circle, size: 50),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                  Text(
                    'scores',
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
            ),
          ],
          
        ),
      ),
    );
  }
}


