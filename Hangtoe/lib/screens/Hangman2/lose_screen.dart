import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Hangman2/game_screen.dart';
import 'package:flutter_application_1/screens/Hangman2/type_word_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../Utils/data.dart';
import 'package:flutter_application_1/providers/user_provider.dart';

  class LoseScreen extends ConsumerStatefulWidget {
    static const String routeName = '/lose-screen';

    const LoseScreen({super.key});
    @override
      ConsumerState<LoseScreen> createState() => _LoseScreenState();
  }

  class _LoseScreenState extends ConsumerState<LoseScreen> {
  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String word = data['word'];
    final int score = data['score'];
    final String guessedWord = data['guessedWord'];

    final theme = Theme.of(context);
    return Scaffold(
      // backgroundColor: theme.accentColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.network(
            //     'https://cdn.pixabay.com/photo/2016/03/31/19/46/cackle-1295277_960_720.png',
            //     scale: 2.5),
            const SizedBox(
              height: 30,
            ),
            Text("\nHARD LUCK!\n"+ref.watch(nickname1Proivder)+"\nLOSE",
              textAlign: TextAlign.center,
              style:theme.textTheme.headline1!.copyWith(color: Colors.white,fontSize: 50.0),
            ),

            Text(
              "Your score : $score",
              textAlign: TextAlign.center,
              style:
              theme.textTheme.headline1!.copyWith(color: Colors.white,fontSize: 24.0),
            ),const SizedBox(height: 10,),
            Text(
              "Word : $guessedWord",
              textAlign: TextAlign.center,
              style:
              theme.textTheme.headline1!.copyWith(color: Colors.white,fontSize: 24.0),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              // splashColor: theme.primaryColor.withOpacity(0.3),
              // shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(5.0)),
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil("/", (route) => false);
              },
              child: FittedBox(
                child: Text("Main Menu", style: theme.textTheme.headline5),
              ),
              // color: theme.primaryColor,
              // padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            ), const SizedBox(height: 15,),
            ElevatedButton(
              // splashColor: theme.primaryColor.withOpacity(0.3),
              // shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(5.0)),
                onPressed: () => Navigator.pushNamed(context,Data.type == "Oneplayer" ? '/Categories':TypeWordScreen.routeName,arguments: ""),
                // Navigator.pushReplacementNamed(context, Data.type == "Oneplayer" ? GameScreen.routeName : TypeWordScreen.routeName,arguments: "")  ,
              child: FittedBox(
                child: Text("Play Again", style: theme.textTheme.headline5),
              ),
              // color: theme.primaryColor,
              // padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            ),
          ],
        ),
      ),
    );
  }
}
