import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(
    this.startQuiz, {
    Key? key,
  }) : super(key: key);

  final void Function() startQuiz;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [Colors.deepPurple, Colors.purple.shade200],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      )),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'images/quiz-logo.png',
              color: const Color.fromARGB(120, 255, 255, 255),
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20),
            Text(
              'Learn Flutter the fun way',
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: startQuiz,
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              icon: const Icon(Icons.arrow_right_sharp),
              label: const Text(
                'Start Quiz',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
