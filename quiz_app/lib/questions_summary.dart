import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    SizedBox(
                        height: 30,
                        child: CircleAvatar(
                          backgroundColor:
                              data['selected_answer'] == data['correct_answer']
                                  ? Colors.cyan
                                  : const Color.fromARGB(255, 240, 64, 123),
                          child: Text(
                            ((data['question_index'] as int) + 1).toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                        )),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            data['question'] as String,
                            style: GoogleFonts.lato(
                                color: Colors.white, fontSize: 18),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          RichText(
                            text: TextSpan(
                                text: ("Selected: "),
                                style: const TextStyle(
                                    color: Colors.cyan, fontSize: 14),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: data['selected_answer'] as String,
                                      style: const TextStyle(color: Colors.white))
                                ]),
                          ),
                          RichText(
                            text: TextSpan(
                                text: ("Correct: "),
                                style: const TextStyle(
                                    color: Colors.cyan, fontSize: 14),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: data['correct_answer'] as String,
                                      style: const TextStyle(color: Colors.white))
                                ]),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
