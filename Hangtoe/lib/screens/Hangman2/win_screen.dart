import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/user_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_1/screens/Hangman2/game_screen.dart';
import 'package:flutter_application_1/screens/Hangman2/type_word_screen.dart';
import '../../Utils/data.dart';

class WinScreen extends ConsumerStatefulWidget {
  static const routeName = "/win-screen";

  const WinScreen({super.key});
  @override
  ConsumerState<WinScreen> createState() => _WinScreenState();
}

class _WinScreenState extends ConsumerState<WinScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String word = data['word'];
    final int score = data['score'];
    final String guessedWord = data['guessedWord'];

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              ref.watch(nickname1Proivder) + "\nWIN",
              textAlign: TextAlign.center,
              style: theme.textTheme.headline2!
                  .copyWith(color: Colors.white, fontSize: 50.0),
            ),
            Text(
              "Your score: $score",
              style: theme.textTheme.headline2!
                  .copyWith(color: Colors.white, fontSize: 28),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Word : $guessedWord",
              textAlign: TextAlign.center,
              style: theme.textTheme.headline1!.copyWith(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(
                  context,
                  Data.type == "Oneplayer"
                      ? GameScreen.routeName
                      : TypeWordScreen.routeName,
                  arguments: ""),
              child: FittedBox(
                child: Text("Play Again",
                    style: theme.textTheme.headline6!
                        .copyWith(color: Colors.black)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context)
                  .pushNamedAndRemoveUntil("/", (route) => false),
              child: FittedBox(
                child: Text("Main Menu",
                    style: theme.textTheme.headline6!
                        .copyWith(color: Colors.black)),
              ),
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
