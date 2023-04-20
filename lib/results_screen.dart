import 'package:flutter/material.dart';
import './data/questions.dart';
import './questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.handlePress, this.userAnswers, {super.key});

  final void Function() handlePress;
  final List<String> userAnswers;

  // final Iterable<String> questionList = questions.map((question) {
  //   return question.text;
  // });

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < questions.length; i++) {
      summary.add({
        "question_index": i,
        "question": questions[i].text,
        "correct_answer": questions[i].answers[0],
        "user_answer": userAnswers[i],
      });
    }
    print(summary);
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    int getCorrectAnswer() {
      int count = 0;
      List<Map<String, Object>> data = getSummaryData();
      for (int i = 0; i < data.length; i++) {
        if ((data[i]["user_answer"] as String) ==
            (data[i]["correct_answer"] as String)) {
          count++;
        }
      }
      return count;
    }

    return Container(
      width:
          double.infinity, // make the width of the container the entire screen
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 95, 37, 172),
        Color.fromARGB(255, 111, 17, 128)
      ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "You answered ${getCorrectAnswer()} out of ${questions.length} questions correctly",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          // ...questionList.map((question) {
          //   return Text(
          //     question,
          //     style: const TextStyle(color: Colors.white),
          //     textAlign: TextAlign.center,
          //   );
          // }),
          const SizedBox(
            height: 30,
          ),
          // const Text("List of answers and questions..."),
          // ...userAnswers.map(
          //   (answer) {
          //     return Text(
          //       answer,
          //       style: const TextStyle(color: Colors.white),
          //     );
          //   },
          // ),
          QuestionsSummary(getSummaryData()),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton(
              onPressed: handlePress,
              child: const Text(
                "Restart quiz",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
