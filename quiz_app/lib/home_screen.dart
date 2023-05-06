import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/quiz-logo.png',
              width: 300, color: const Color.fromARGB(180, 255, 255, 255)),
          const SizedBox(height: 60),
          Text(
            'Learn Flutter the fun way',
            style: GoogleFonts.lato(fontSize: 28, color: Colors.white),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
              style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
              onPressed: startQuiz,
              icon: const Icon(Icons.arrow_right_alt),
              label: const Text('Start Quiz'))
        ],
      ),
    );
  }
}
