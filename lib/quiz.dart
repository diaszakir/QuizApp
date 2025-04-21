import 'package:flutter/material.dart';
import 'package:quiz_app_practice/data/questions.dart';
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

  void chosenAnswer(String answer) {
    selectedAnswers.add(answer);

    if(selectedAnswers.length == questions.length){
      setState(() {
        activeScreen == 'results-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == "questions-screen") {
      // screenWidget = QuestionsScreen();
    }

    if (activeScreen == "results-screen") {
      // screenWidget = ResultsScreen(selectedAnswers, resta);
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 21, 161, 255),
                Color.fromARGB(255, 0, 112, 186)
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