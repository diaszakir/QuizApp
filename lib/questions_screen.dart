import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app_practice/answer_button.dart';
import 'package:quiz_app_practice/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.chosenAnswer, {super.key});

  final void Function(String name) chosenAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String answer) {
    widget.chosenAnswer(answer);

    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    var currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.shuffleAnswer.map((answer) {
              return AnswerButton(
                answer,
                () {
                  answerQuestion(answer);
                }
              );
            })
          ],
        ),
      ),
    );
  }
}