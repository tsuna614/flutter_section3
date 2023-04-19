import 'package:flutter/material.dart';
import './styled_button.dart';
import './data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen(this.handlePress, {super.key});

  final void Function() handlePress;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var i = 0;

  void handleClick() {
    setState(() {
      i++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[i];
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 95, 37, 172),
        Color.fromARGB(255, 111, 17, 128)
      ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                currentQuestion.text,
                style: const TextStyle(color: Colors.white, fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ...currentQuestion.getShuffledAnswers().map((answer) {
            return StyledButton(answer, handleClick);
          }),
          // StyledButton(currentQuestion.answers[0], () {
          //   print("1");
          // }),
          // StyledButton(currentQuestion.answers[1], () {
          //   print("2");
          // }),
          // StyledButton(currentQuestion.answers[2], () {
          //   print("3");
          // }),
          // StyledButton(currentQuestion.answers[3], () {
          //   print("4");
          // }),
        ]),
      ),
    );
  }
}
