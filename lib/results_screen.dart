import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/summary_data.dart';

import 'data/questions.dart';

class ResultsScreen extends StatelessWidget {
  final List<String> answeredQuestions;
  final void Function() restartQuiz;

  const ResultsScreen(this.answeredQuestions, this.restartQuiz, {Key? key}) : super(key: key);
  List<Map<String, Object>> get summaryData {
    List<Map<String, Object>> summaryData = [];
    for (var i = 0; i < answeredQuestions.length; i++) {
      summaryData.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': answeredQuestions[i],
      });
    }
    return summaryData;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = questions.length;
    final numCorrectAnswers = summaryData
        .where(((element) =>
            element['user_answer'] == element['correct_answer'] ? true : false))
        .length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(8),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'You answered $numCorrectAnswers out of $numTotalQuestions questions correctly!',
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 217, 185, 255),
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          SummaryData(summaryData),
          TextButton.icon(
            onPressed: restartQuiz,
            icon: const Icon(
              Icons.restart_alt,
              color: Colors.white,
            ),
            label: const Text(
              "Restart quiz",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ]),
      ),
    );
  }
}
