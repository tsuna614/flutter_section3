import 'package:flutter/material.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen(this.handlePress, {super.key});

  final void Function() handlePress;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.amber),
      child: Center(
        child: OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_right_alt,
            color: Colors.white,
          ), // add the arrow icon on the button
          label: const Text(
            "Start quiz",
            style: TextStyle(color: Colors.white),
          ), // when adding .icon after OutlinedButton, "child" should be changed into "label"
        ),
      ),
    );
  }
}
