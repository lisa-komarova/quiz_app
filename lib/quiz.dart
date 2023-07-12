import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({
    Key? key,
  }) : super(key: key);

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  List<String> answeredQuestions = [];
  late Widget activeScreen;

  void chooseAnswer(String answer) {
    answeredQuestions.add(answer);
    if (answeredQuestions.length == questions.length) {
      setState(() {
        activeScreen = ResultsScreen(answeredQuestions, startQuiz);
        answeredQuestions = [];
      });
    }
  }

  @override
  void initState() {
    activeScreen = StartScreen(startQuiz);
    super.initState();
  }

  void startQuiz() {
    setState(() {
      activeScreen = QuestionsScreen(
        chooseAnswer: chooseAnswer,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          backgroundColor: Colors.deepPurple,
        ),
        home: Scaffold(
          body: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [Colors.deepPurple, Colors.purple.shade200],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )),
              child: activeScreen),
        ));
  }
}
