// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/figure_image.dart';
import 'package:flutter_application_1/data.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Stack(
                  children: [
                    //let's make the figure widget
                    //let's add the images to the asset folder
                    //Okey now we will create a Game class
                    //Now the figure will be built according to the number of tries
                    figureImage(Game.tries >= 0, "assets/hang.png"),
                    figureImage(Game.tries >= 1, "assets/head.png"),
                    figureImage(Game.tries >= 2, "assets/body.png"),
                    figureImage(Game.tries >= 3, "assets/ra.png"),
                    figureImage(Game.tries >= 4, "assets/la.png"),
                    figureImage(Game.tries >= 5, "assets/rl.png"),
                    figureImage(Game.tries >= 6, "assets/ll.png"),
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
