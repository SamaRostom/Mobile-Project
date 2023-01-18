import 'package:flutter/material.dart';


class GuessLetter extends StatelessWidget {

  //------------| The word letter widget _ - not guessed letter A-guessed letter |-------------

  final String title;
  final bool isGuessed;
  const GuessLetter(this.title,this.isGuessed, {super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3.0),
      child: Column(
        children: [
          Text(isGuessed ? title : "",style: theme.textTheme.headline6!.copyWith(fontSize: 24.0),),
          Container( color: title!=" " ? theme.primaryColor: Colors.transparent, width: 30,height: 2,)
        ],
      ),
    );
  }
}
