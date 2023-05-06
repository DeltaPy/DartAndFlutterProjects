import 'package:flutter/material.dart';


class AnswerButton extends StatelessWidget {
  const AnswerButton(
      {super.key, required this.answerText, required this.onClick});

  final String answerText;
  final void Function() onClick;

  @override
  Widget build(context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 33, 1, 95),
          foregroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40)),
      onPressed: onClick,
      child: Text(
        answerText,
        textAlign: TextAlign.center,
      ),
    );
  }
}
