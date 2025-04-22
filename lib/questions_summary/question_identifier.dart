import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget{
  const QuestionIdentifier(this.isCorrectAnswer, this.itemIndex, {super.key});

  final bool isCorrectAnswer;
  final int itemIndex;

  @override
  Widget build(context) {
    final questionNumber = itemIndex + 1;
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isCorrectAnswer ? const Color.fromARGB(255, 150, 198, 241) : const Color.fromARGB(255, 249, 133, 241),
        borderRadius: BorderRadius.circular(100)
      ),
      child: Text(
        questionNumber.toString(),
        style: TextStyle(
          color: Color.fromARGB(255, 22, 2, 56),
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}