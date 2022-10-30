import 'package:flutter/material.dart';
import 'package:flutter_application_1/data.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/letter.dart';
import 'package:flutter_application_1/figure_image.dart';
// import 'package:flutter_application_1/drawing.dart';

class HangmanBoard extends StatefulWidget {
  const HangmanBoard({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HangmanBoardState createState() => _HangmanBoardState();
}

// class _HangmanBoardState extends State<HangmanBoard>{
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Column(
//           //choosing the game word
//           //   List<String> getAlphebat() {
//           //   List<String> alphabets = [];
//           //   for (int i = 65; i <= 90; i++) {
//           //     alphabets.add(String.fromCharCode(i));
//           //   }
//           //   return alphabets;
//           // }
//           children: [
//             //for (int i = 65; i <= 90; i++){
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 shape: RoundedRectangleBorder( //to set border radius to button
//                   borderRadius: BorderRadius.circular(20)
//                 ),
//               ),
//               onPressed: () {},
//               child: const Text('Hangman',style: TextStyle(fontSize: 20,),),
//             ),
//           //}
//           ],
//         ),
//       ),
//     );
//   }
// }

class _HangmanBoardState extends State<HangmanBoard> {
  //choosing the game word
  String word = "Flutter".toUpperCase();
  //Create a list that contains the Alphabet, or you can just copy and paste it
  List<String> alphabets = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        title: Text("Hangman"),
        elevation: 0,
        centerTitle: true,
        // backgroundColor: AppColor.primaryColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Now we will build the Hidden word widget
          //now let's go back to the Game class and add
          // a new variable to store the selected character
          /* and check if it's on the word */

          // HomeApp.figureImage();
          // Text(HomeApp.draw),
          // children: [

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

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: word
                .split('')
                .map((e) => letter(e.toUpperCase(),
                    !Data.selectedChar.contains(e.toUpperCase())))
                .toList(),
          ),

          //Now let's build the Game keyboard
          SizedBox(
            width: double.infinity,
            height: 250.0,
            child: GridView.count(
              crossAxisCount: 7,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              padding: EdgeInsets.all(8.0),
              children: alphabets.map((e) {
                return RawMaterialButton(
                  onPressed: Data.selectedChar.contains(e)
                      ? null // we first check that we didn't selected the button before
                      : () {
                          setState(() {
                            Data.selectedChar.add(e);
                            print(Data.selectedChar);
                            if (!word.split('').contains(e.toUpperCase())) {
                              Data.tries++;
                            }
                          });
                        },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Text(
                    e,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  fillColor: Data.selectedChar.contains(e)
                      ? Colors.black87
                      : Colors.blue,
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
