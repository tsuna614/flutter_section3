import 'package:adv_basics/styled_button.dart';
import 'package:flutter/material.dart';
import './styled_button.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 161, 218, 207),
        Color.fromARGB(255, 65, 255, 252)
      ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text("Question 1..."),
          const SizedBox(
            height: 30,
          ),
          // ElevatedButton(onPressed: () {}, child: const Text("Answer 1")),
          // ElevatedButton(onPressed: () {}, child: const Text("Answer 2")),
          // ElevatedButton(onPressed: () {}, child: const Text("Answer 3")),
          StyledButton("Answer 1", () {
            print("1");
          }),
          StyledButton("Answer 2", () {
            print("2");
          }),
          StyledButton("Answer 3", () {
            print("3");
          }),
        ]),
      ),
    );
  }
}
