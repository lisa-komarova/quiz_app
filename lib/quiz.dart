import 'package:flutter/material.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start_screen.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({
    Key? key,
  }) : super(key: key);

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  late Widget activeScreen;

  @override
  void initState() {
    activeScreen = StartScreen(startQuiz);
    super.initState();
  }

  void startQuiz() {
    setState(() {
      activeScreen = const QuestionsScreen();
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
          body: activeScreen,
        ));
  }
}
