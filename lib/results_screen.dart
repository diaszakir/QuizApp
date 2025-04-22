import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app_practice/data/questions.dart';
import 'package:quiz_app_practice/questions_summary/questions_summary.dart';

class ResultsScreen extends StatelessWidget{
  const ResultsScreen(this.chosenAnswer, this.onRestart, {super.key});

  final List<String> chosenAnswer;
  final void Function() onRestart;

  List<Map<String, Object>> get summaryData {
    List<Map<String, Object>> summary = [];

    for(var i = 0; i < chosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answer[0],
        'user_answer': chosenAnswer[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numOfTotalQuestions = questions.length;
    final numOfCorrectAnswers = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numOfCorrectAnswers out of $numOfTotalQuestions questions correctly!',
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            QuestionsSummary(summaryData),
            const SizedBox(height: 30),
            TextButton.icon(
              onPressed: onRestart,
              icon: Icon(Icons.refresh), 
              style: TextButton.styleFrom(
                foregroundColor: Colors.white
              ),
              label: Text("Restart Quiz")
            ) 
          ],
        ),
      ),
    );
  }
}