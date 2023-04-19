import 'package:flutter/material.dart';

class StyledButton extends StatelessWidget {
  const StyledButton(this.text, this.onClick, {super.key});

  final String text;
  final void Function() onClick;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onClick,
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(300, 10),
            // padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            backgroundColor: const Color.fromARGB(
                255, 77, 10, 122), // change background color of button
            foregroundColor: Colors.white, // change text color of button
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    40))), // make button rounder on the edges
        child: Text(
          text,
          textAlign: TextAlign.center,
        ));
  }
}
