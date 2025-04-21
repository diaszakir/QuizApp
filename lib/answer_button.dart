import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget{
  const AnswerButton(this.answerText, this.onTap, {super.key});

  final String answerText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5),
      child: ElevatedButton(
        onPressed: onTap, 
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 40
          ),
          foregroundColor: Colors.white,
          backgroundColor: const Color.fromARGB(255, 33, 1, 95)
        ),
        child: Text(answerText, textAlign: TextAlign.center,)
      )
    );
  }
}