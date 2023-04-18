import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  void handlePress() {
    print("I got clicked.");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 95, 37, 172),
        Color.fromARGB(255, 111, 17, 128)
      ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(
                228, 255, 255, 255), // add a little transparency to the image
          ),
          Container(
            padding: const EdgeInsets.only(top: 60, bottom: 30),
            child: const Text(
              "Learn flutter the fun way!",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  decoration: TextDecoration.none),
            ),
          ),
          OutlinedButton.icon(
            onPressed: handlePress,
            icon: const Icon(
              Icons.arrow_right_alt,
              color: Colors.white,
            ), // add the arrow icon on the button
            label: const Text(
              "Start quiz",
              style: TextStyle(color: Colors.white),
            ), // when adding .icon after OutlinedButton, "child" should be changed into "label"
          ),
        ]),
      ), // To make the entire column at the center of the screen
    );
  }
}
