import 'package:flutter/material.dart';
import './start_screen.dart';
import './question_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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

  var activeScreen = "start_screen";

  void handlePress() {
    setState(() {
      if (activeScreen == "start_screen") {
        activeScreen = "question_screen";
      }
    });
    print("I got clicked!");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Demo App",
        home: Scaffold(
          body: activeScreen == "start_screen"
              ? StartScreen(handlePress)
              : QuestionScreen(handlePress),
        ));
  }
}
