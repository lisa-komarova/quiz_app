import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'answer_button.dart';

class QuestionsScreen extends StatefulWidget {
  final void Function(String) chooseAnswer;
  const QuestionsScreen({Key? key, required this.chooseAnswer}) : super(key: key);

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var activeQuestion = 0;
  void answerQuestion(String answer) {
    widget.chooseAnswer(answer);
    setState(() {
      activeQuestion++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[activeQuestion];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.shuffledList.map(
                  (e) => AnswerButton(
                      title: e,
                      onTap: () {
                        answerQuestion(e);
                      }),
                ),
          ],
        ),
      ),
    );
  }
}
