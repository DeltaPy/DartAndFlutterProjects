import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/home_screen.dart';
import 'package:quiz_app/quiz_screen.dart';
import 'package:quiz_app/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'home-screen';
  final List<String> selectedAnswers = [];

  // Widget? activeScreen;
  // @override
  // void initState() {
  //   activeScreen = HomeScreen(switchScreen);
  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      activeScreen = 'quiz-screen';
      // activeScreen = const QuizScreen();
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void restart() {
    setState(() {
    activeScreen = 'home-screen';
    selectedAnswers.clear();
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = HomeScreen(switchScreen);

    if (activeScreen == 'quiz-screen') {
      screenWidget = QuizScreen(onSelectAnswer: chooseAnswer);
    }
    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
        onRestart: restart,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [Colors.deepPurple, Color.fromARGB(255, 86, 41, 207)],
            begin: Alignment.topCenter,
          )),
          child: screenWidget,
        ),
      ),
    );
  }
}
