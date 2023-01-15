import 'package:flutter/material.dart';

class LetterClick extends StatelessWidget {

  //---------------------| Alphabet letter widget |--------------------------

  final String title;
  final bool isChoose;
  final bool isContainsInWord;
  final Function letterClick;

  const LetterClick(this.title,this.isChoose,this.isContainsInWord,this.letterClick, {super.key});


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final deviceHeight = MediaQuery.of(context).size.height;
    return InkWell(
      borderRadius: BorderRadius.circular(10.0),
      onTap: isChoose ? null : () => letterClick(title),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 3,vertical: 3.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: isChoose ? isContainsInWord ? Colors.greenAccent[100] : Colors.redAccent[100] : Colors.deepPurple[500],
        ),
        width: deviceHeight*0.06,
        height: deviceHeight*0.06,
        alignment: Alignment.center,
        child: FittedBox(
          child: Text(
          title,style: theme.textTheme.headline6!.copyWith(fontSize: 30.0,color: isChoose ? isContainsInWord ? Colors.green[900] : Colors.white : Colors.white,),
          ),
        ),
      ),
    );
  }
}
