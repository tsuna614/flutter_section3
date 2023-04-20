import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: SingleChildScrollView(
        // make the content scrollable
        child: Column(
          children: summaryData.map((data) {
            return Row(
              children: [
                ClipOval(
                  child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          color: (data['user_answer'] == data["correct_answer"])
                              ? const Color.fromARGB(255, 51, 158, 234)
                              : const Color.fromARGB(255, 247, 88, 77)),
                      child: Center(
                          child: Text(
                              (((data['question_index'] as int) + 1))
                                  .toString(), // lay question_index ra, + them 1 don vi va dua no vao Text()
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold)))),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment
                        .start, // left align all elements in the column
                    children: [
                      Text(
                        "Question:   ${(data['question'] as String)}",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      Text(
                        "Your answer: ${(data['user_answer'] as String)}",
                        style: const TextStyle(
                            color: Color.fromARGB(255, 202, 162, 212)),
                      ),
                      Text(
                        "Correct answer: ${(data["correct_answer"] as String)}",
                        style: const TextStyle(
                            color: Color.fromARGB(255, 162, 205, 212)),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
