import 'package:flutter/material.dart';
import './start_screen.dart';
import './question_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  /*
  // Widget activeScreen = StartScreen(handlePress);
  Widget? activeScreen;

  @override
  void initState() {
    activeScreen = StartScreen(handlePress);
    super.initState();
  } // special function to initiate state for active screen. If you try to initialize it without this function (as shown in the comment above) it won't work
  // learn more about the "flutter widget lifecycle"
  */

  // ALTERNATIVE

  final List<String> selectedAnswers = [];

  var activeScreen = "start_screen";

  void handlePress() {
    setState(() {
      if (activeScreen == "start_screen") {
        activeScreen = "question_screen";
      }
    });
    print("I got clicked!");
  }

  void chosenAnswer(answer) {
    selectedAnswers.add(answer);
    print(selectedAnswers);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Demo App",
        home: Scaffold(
            body: activeScreen == "start_screen"
                ? StartScreen(handlePress)
                // : QuestionScreen(handlePress),
                ////neu de nhu nay se bi bug, vi trong question_screen.dart dung required this.onSelectedAnswer
                : QuestionScreen(
                    onSelectAnswer: chosenAnswer,
                  )));
  }
}
