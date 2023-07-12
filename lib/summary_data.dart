import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryData extends StatelessWidget {
  final List<Map<String, Object>> summaryData;
  const SummaryData(this.summaryData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ...summaryData
              .map((e) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: e['correct_answer'] == e['user_answer']
                                ? Colors.green
                                : Colors.red,
                          ),
                          child: Text(
                            ((e['question_index'] as int) + 1).toString(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                e['question'] as String,
                                style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(e['correct_answer'] as String, style: GoogleFonts.lato(
                                  color: const Color.fromARGB(255, 231, 146, 255),
                                  fontSize: 15,
                                ),),
                              Text(e['user_answer'] as String, style: GoogleFonts.lato(
                                  color: const Color.fromARGB(255, 188, 235, 255),
                                  fontSize: 15,
                                ),),
                            ],
                          ),
                        )
                      ],
                    ),
                  ))
              .toList()
        ]),
      ),
    );
  }
}
