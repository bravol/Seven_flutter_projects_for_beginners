import 'package:second_flutter_app/data/questions.dart';
import 'package:second_flutter_app/questions_screen.dart';
import 'package:second_flutter_app/result_screen.dart';
import 'package:second_flutter_app/start_screen.dart';
import 'package:flutter/material.dart';

//always statefull widget have more than one class
class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

//private class that is used only in this file
class _QuizState extends State<Quiz> {
  // Widget? activeScreen;

  // //built in state methods
  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  // //a method to switch screens
  // void switchScreen() {
  //   setState(() {
  //     activeScreen = const QuestionsScreen();
  //   });
  // }

  //2a another method of swtiching screens
  List<String> selectedAnswers = []; //storing selected answers
  var activeScreen = 'start-screen';

  //a method to switch screens
  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  //another method for answer
  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        // selectedAnswers = [];
        activeScreen = 'result-screen';
      });
    }
  }

  @override
  Widget build(context) {
    //2b
    // final screenWidget = activeScreen == 'start-screen'
    //     ? StartScreen(switchScreen)
    //     : QuestionsScreen(onSelectAnswer: chooseAnswer);
    //or
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(
        choseAnswers: selectedAnswers,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(130, 66, 240, 1),
                Color.fromARGB(255, 26, 4, 63),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          // child: activeScreen,
          // or2a using a ternary expression
          // child: activeScreen == 'start-screen'
          //     ? StartScreen(switchScreen)
          //     : const QuestionsScreen(),
          //2b
          child: screenWidget,
        ),
      ),
    );
  }
}
