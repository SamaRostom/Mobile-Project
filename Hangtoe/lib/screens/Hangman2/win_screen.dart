import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Hangman2/game_screen.dart';
import 'package:flutter_application_1/screens/Hangman2/type_word_screen.dart';

class WinScreen extends StatelessWidget {
  static const routeName = "/win-screen";

  const WinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String word = data['word'];
    final int score = data['score'];
    final String guessedWord = data['guessedWord'];

    return Scaffold(
      // backgroundColor: theme.accentColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You win",
              style:
                  theme.textTheme.headline1!.copyWith(color: theme.primaryColor),
            ),
            Text(
              "Your score: $score",
              style: theme.textTheme.headline1!
                  .copyWith(color: theme.primaryColor, fontSize: 28),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Word : $guessedWord",
              textAlign: TextAlign.center,
              style: theme.textTheme.headline1!
                  .copyWith(color: theme.primaryColor, fontSize: 24.0),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              // splashColor: theme.primaryColor.withOpacity(0.3),
              // shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(5.0)),
              onPressed: () => Navigator.pushReplacementNamed(context,
                  word == "" ? GameScreen.routeName : TypeWordScreen.routeName,
                  arguments: ""),
              child: FittedBox(
                child: Text("Play Again",
                    style: theme.textTheme.headline6!
                        .copyWith(color: Colors.black)),
              ),
              // color: theme.primaryColor,
              // padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              // splashColor: theme.primaryColor.withOpacity(0.3),
              // shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(5.0)),
              onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil("/", (route) => false),
              child: FittedBox(
                child: Text("Main Menu",
                    style: theme.textTheme.headline6!
                        .copyWith(color: Colors.black)),
              ),
              // color: theme.primaryColor,
              // padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
