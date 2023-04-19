import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.handlePress, {super.key});

  final void Function() handlePress;

  @override
  Widget build(BuildContext context) {
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
          const Text("You answered X out of Y questions correctly"),
          const SizedBox(
            height: 30,
          ),
          const Text("List of answers and questions..."),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton(
              onPressed: handlePress, child: const Text("Restart quiz"))
        ],
      ),
    );
  }
}
