import 'package:flutter/material.dart';
import 'package:flutter_application_1/data.dart';

class PName extends StatefulWidget {
  const PName({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PNameState createState() => _PNameState();
}

class _PNameState extends State<PName> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            const Text(
              'Enter the Players Name',
              textAlign: TextAlign.center,
            ),
            Data.player == 2
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter 1 Player Name',
                        ),
                      ),
                      const SizedBox(height: 20),
                      const TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter 2 Player Name',
                        ),
                      ),
                      ButtonBar(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('Next'),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('Cancel'),
                          )
                        ],
                      )
                    ],
                  )
                : Column(
                    children: [
                      const TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter Player Name',
                        ),
                      ),
                      ButtonBar(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('Next'),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('Cancel'),
                          )
                        ],
                      )
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
