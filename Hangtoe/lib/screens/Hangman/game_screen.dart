import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/hangman_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../Utils/data.dart';
import '../../providers/score_provider.dart';
import '../../services/score_service.dart';
import 'win_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/Hangman/alphabet_letter.dart';
import '../../models/Hangman/game.dart';
import 'lose_screen.dart';
import '../../models/Hangman/guess_letter_model.dart';
import '../../widgets/Hangman/guess_letter.dart';
import '../../widgets/Hangman/letter_click.dart';

class GameScreen extends ConsumerStatefulWidget {
  static const routeName = "/game";

  const GameScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  ConsumerState<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends ConsumerState<GameScreen> {

  late Timer _timer;

  // final RandomWord _randomWordApi = RandomWord();
  final Game game = Game(time: 30,score: 0,lives: 5, word: "Hangman");

  //random word letters
  List<GuessLetterModel> guessedLetters = [];
  //alphabet
  List<AlphabetLetter> clickAlphabetLetters =[];
  // List<String> wordList = ["dart", "flutter", "mobile", "development"];
  //------------------| Start timer |---------------------
  void startTime(){
    ref.read(timeProivder.notifier).state = game.time!;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if(ref.watch(timeProivder)<=0) {
          lose();
        } else {
          ref.read(timeProivder.notifier).state = ref.watch(timeProivder) - 1;
        }


      // setState(() {
      //   if(game.time!<=0) {
      //     lose();
      //   } else {
      //     game.time = game.time! - 1;
      //   }
      // });
    });
  }

  // @override
  // void initState() {
  //   super.initState();
  //   var random = new Random();
  //   ref.read(wordProivder.notifier).state = wordList[random.nextInt(wordList.length)];
  // }



  //=======================================================

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      // backgroundColor: theme.colorScheme.secondary,
      body: SafeArea(
        child: guessedLetters.isEmpty
            ? Center(
                child: Text(
                  "Generating word...",
                  style: theme.textTheme.headline6!
                      .copyWith(fontSize: 32.0, color: theme.primaryColor),
                ),
              )
            : Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    height: deviceHeight * 0.2,
                    width: double.infinity,
                    color: theme.primaryColor,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            "lives : ${game.lives}",
                            style: theme.textTheme.headline5,
                          ),
                        ),const SizedBox(width: 25.0,),
                        Expanded(
                          flex: 3,
                          child: Center(
                            child: Image.asset(
                              'assets/${5-game.lives!}.png',
                            ),
                          ),
                        ),const SizedBox(width: 25.0,),
                        Expanded(
                          flex: 2,
                          child: Text(
                            "0:${ref.watch(timeProivder)<10 ? "0":""}${ref.watch(timeProivder)}",
                            style: theme.textTheme.headline5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 10, 10, 0),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: FittedBox(
                        child: Text(
                          "score : ${game.score}",
                          style: TextStyle(
                              fontSize: 20.0,
                              color: theme.primaryColor,
                              fontFamily: "ArchitectsDaughter"),
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    color: theme.primaryColor,
                    thickness: 2.0,
                  ),
                  SizedBox(
                    height: deviceHeight * 0.1,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Wrap(
                      children: [
                        //setup word in guessLetter widget
                        ...guessedLetters
                            .map((letter) =>
                                GuessLetter(letter.title, letter.isGuessed))
                            .toList()
                      ],
                    ),
                  ),
                  SizedBox(
                    height: deviceHeight * 0.1,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Wrap(
                      alignment: WrapAlignment.start,
                      children: [
                        //show alphabet
                        ...clickAlphabetLetters.map((letter) =>
                          LetterClick(letter.title,letter.isChoose,letter.isContainsInWord,alphabetLetterClick)
                        ).toList()
                      ],
                    ),
                  )
                ],
              ),
      ),
    );
  }

  //----------------| Get random word or word from user typing|---------------------
  Future getWord(BuildContext context) async {
    try{
      if(Data.type == "Oneplayer"){
        var random = Random();
        ref.read(wordProivder.notifier).state = Data.wordList[random.nextInt(Data.wordList.length)];
          if(Data.category == "animals") {
            ref.read(wordProivder.notifier).state = Data.animals[random.nextInt(Data.animals.length)];
          }else if(Data.category == "sports"){
            ref.read(wordProivder.notifier).state = Data.sports[random.nextInt(Data.sports.length)];
          }else if(Data.category == "countries"){
            ref.read(wordProivder.notifier).state = Data.countries[random.nextInt(Data.countries.length)];
          }
      }
      // String routeWord = (ModalRoute.of(context)!.settings.arguments as String);
      String routeWord = ref.watch(wordProivder);
      if(routeWord==""){
        // Map map = await _randomWordApi.getWord();
        // setState(() => this.game.word = map['word']);
      }else{
        setState(() => game.word = routeWord);
      }

      setState(() {
        for (int i = 0; i < game.word!.length; i++){
          guessedLetters.add(GuessLetterModel(game.word![i], false));
        }

        //if word contains space mark it as guessed
        for (var element in guessedLetters) {
          element.title==" " ? element.isGuessed = true : element.isGuessed = false;
        }
        getAlphabet();
      });


      startTime();
    // ignore: empty_catches
    }catch(e){}
  }

  //========================================================

  //----------------| get alphabel and setup it into list |---------------------
  // ignore: avoid_function_literals_in_foreach_calls
  void getAlphabet() => setState(() => AlphabetLetter.alphabet.forEach((letter) => clickAlphabetLetters.add(AlphabetLetter(letter.toUpperCase(),false,game.word!.contains(letter)))));

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero,() {
      getWord(context);
    });
  }
  @override
  void dispose() {
    super.dispose();
    // ignore: unnecessary_null_comparison
    if(_timer!=null) {
      _timer.cancel();
    }
  }

  //---------------------| handle alphabet letter click |------------------------------
  void alphabetLetterClick(String title){
    bool isContains = false;
    setState(() {
      //set letter as guessed
      for (int i = 0; i < game.word!.length; i++){
        if(game.word![i].toUpperCase() == title){
          guessedLetters[i].isGuessed = true;
          game.score = game.score! + ref.watch(timeProivder);
          isContains = true;
        }
      }
      clickAlphabetLetters.where((letter) => letter.title==title).toList()[0].isChoose = true;

      //bad letter click - not contains in the word
      if(!isContains) game.lives = game.lives! -1;

      //game lose
      if(game.lives!<=0) {
        lose();
      }

      //reset time
      ref.read(timeProivder.notifier).state = 30;

      //win the game
      if(guessedLetters.where((element) => element.isGuessed==false).isEmpty) win();
    });
  }
  //====================================================================================

  //lose game
  void lose() => Navigator.pushNamed(context, LoseScreen.routeName,arguments: {
    "score": game.score,
    // "word" : (ModalRoute.of(context)!.settings.arguments as String),
    "word" : (ref.watch(wordProivder)),
    "guessedWord" : game.word
  });

  int? x;
  //win game
  void win() {
    checkHighScore();
    x = game.score! + ref.watch(scoreProivder);
    if(Data.type == "Oneplayer" && (x! > ref.watch(scoreProivder))) {
      ref.read(scoreProivder.notifier).state = x!;
      ScoreService.saveScore(ref);
    }
    Navigator.pushNamed(context, WinScreen.routeName,arguments: {
      "score": game.score,
      // "word" : (ModalRoute.of(context)!.settings.arguments as String),
      "word" : (ref.watch(wordProivder)),
      "guessedWord" : game.word
    });
  }



  //---------------------| Check if the game score is higher than the actual highscore |-------------------------------
  Future checkHighScore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(game.score! >= (prefs.getInt("highScore") ?? 0)) {
      await prefs.setInt("highScore",game.score!);
    }
  }
  //===================================================================================================================

}
