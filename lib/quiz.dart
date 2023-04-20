import 'package:flutter/material.dart';
import 'start_screen/start_screen.dart';
import 'question_screen/question_screen.dart';
import './data/questions.dart'; // import this file to get the length of the questions list
import 'results_screen/results_screen.dart';

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

  List<String> _selectedAnswers = [];

  var activeScreen = "start_screen";
  late Widget screenWidget;

  void handlePress() {
    setState(() {
      if (activeScreen == "start_screen") {
        activeScreen = "question_screen";
        _selectedAnswers =
            []; // moi lan start quiz tu dau se lam moi danh sach _selectedAnswers
      } else if (activeScreen == "results_screen") {
        activeScreen = "start_screen";
      }
    });
    print(activeScreen);
  }

  void chosenAnswer(answer) {
    _selectedAnswers.add(answer);
    print(_selectedAnswers);
    if (_selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = "results_screen";
      });
    }
  }

  Widget _buildChild() {
    if (activeScreen == "start_screen") {
      return StartScreen(handlePress);
    } else if (activeScreen == "question_screen") {
      return QuestionScreen(onSelectAnswer: chosenAnswer);
    } else {
      return ResultScreen(handlePress, _selectedAnswers);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Demo App",
      home: Scaffold(
        // body: activeScreen == "start_screen"
        //     ? StartScreen(handlePress)
        //     // : QuestionScreen(handlePress),
        //     ////neu de nhu nay se bi bug, vi trong question_screen.dart dung required this.onSelectedAnswer
        //     : QuestionScreen(
        //         onSelectAnswer: chosenAnswer,
        //       )));
        body: _buildChild(),
      ),
    );
  }
}
