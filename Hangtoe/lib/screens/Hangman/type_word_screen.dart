import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/hangman_provider.dart';
import 'package:flutter_application_1/screens/Hangman/game_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TypeWordScreen extends ConsumerStatefulWidget {
  static const routeName = "/type-word-screen";

  const TypeWordScreen({super.key});
  @override
  // ignore: library_private_types_in_public_api
  ConsumerState<TypeWordScreen> createState() => _TypeWordScreenState();
}

class _TypeWordScreenState extends ConsumerState<TypeWordScreen> {
  final TextEditingController _wordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).tra,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Type the word",
            style: Theme.of(context).textTheme.headline6!.copyWith(fontSize: 28, color: Colors.white),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              width: double.infinity,
              child: TextField(
                controller: _wordController,
                onSubmitted: (str )=> _submitWord(),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide: const BorderSide(
                            color: Colors.white,
                                // Theme.of(context).primaryColor.withOpacity(0.3),
                            width: 2.0)),
                    labelText: "Type word",
                    labelStyle: const TextStyle(
                        color: Colors.white
                        // Theme.of(context).primaryColor.withOpacity(0.5)
                        ),
                        // color: Colors.blueGrey,
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide:
                            const BorderSide(color: Colors.white, width: 2.0))),
                style: TextStyle(color: Theme.of(context).primaryColor),
              )),const SizedBox(height: 50,),
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: ElevatedButton(
              // splashColor: Theme.of(context).primaryColor.withOpacity(0.3),
              // shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(5.0)),
              onPressed: _submitWord,
              child: FittedBox(
                child: Text("Confirm",
                    style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.white)),
              ),
              // color: Theme.of(context).primaryColor,
              // padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            ),
          ),
        ],
      ),
    );

  }
  void _submitWord(){
    Navigator.pushNamed(context, GameScreen.routeName);
    ref.read(wordProivder.notifier).state = _wordController.text.toLowerCase()??"";
  }

}
