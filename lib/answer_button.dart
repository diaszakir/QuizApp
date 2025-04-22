import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget{
  const AnswerButton(this.answerText, this.onSelectQuestion, {super.key});

  final String answerText;
  final void Function() onSelectQuestion;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5),
      child: ElevatedButton(
        onPressed: onSelectQuestion, 
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 40
          ),
          backgroundColor: const Color.fromARGB(255, 33, 1, 95),
          foregroundColor: Colors.white
        ),
        child: Text(answerText, textAlign: TextAlign.center,)
      )
    );
  }
}