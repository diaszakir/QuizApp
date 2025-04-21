import 'package:flutter/material.dart';
import 'package:quiz_app_practice/data/questions.dart';
import 'package:quiz_app_practice/questions_screen.dart';
import 'package:quiz_app_practice/results_screen.dart';
import 'package:quiz_app_practice/start_screen.dart';

final topAlignment = Alignment.topLeft;
final bottomAlignment = Alignment.bottomRight;

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      activeScreen == 'results-screen';
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == "questions-screen") {
      screenWidget = QuestionsScreen(chooseAnswer);
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 19, 168, 255), 
                const Color.fromARGB(255, 17, 133, 200)
              ],
              begin: topAlignment,
              end: bottomAlignment
            )
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}