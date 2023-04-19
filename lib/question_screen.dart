import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './styled_button.dart';
import './data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen(
      {super.key,
      required this.onSelectAnswer}); // "required" chi them khi cho vao trong ngoac nhon

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var i = 0;

  void handleClick(String selectedAnswer) {
    widget.onSelectAnswer(
        selectedAnswer); // vi stateful widget bi chia ra 2 class, nen muon reference function o ben tren thi phai dung widget
    setState(() {
      i++;
    });
    // print(selectedAnswer);
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
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ), // container for the question text widget
          const SizedBox(
            height: 30,
          ),
          ...currentQuestion.getShuffledAnswers().map((answer) {
            // ham getShuffledAnswers (trong file .dart cua quiz models) se tra ve mot list<string> temp duoc shuffle tu list<string> cua answers
            return StyledButton(answer, () {
              handleClick(answer);
            });
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
