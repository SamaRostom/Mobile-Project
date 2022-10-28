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
                    figureImage(Data.tries >= 0, "assets/hang.png"),
                    figureImage(Data.tries >= 1, "assets/head.png"),
                    figureImage(Data.tries >= 2, "assets/body.png"),
                    figureImage(Data.tries >= 3, "assets/ra.png"),
                    figureImage(Data.tries >= 4, "assets/la.png"),
                    figureImage(Data.tries >= 5, "assets/rl.png"),
                    figureImage(Data.tries >= 6, "assets/ll.png"),
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
