import 'package:flutter/material.dart';
import 'package:second_flutter_app/answer_button.dart';
import 'package:second_flutter_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

//ths is a widget class
class QuestionsScreen extends StatefulWidget {
  //constructor
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

//this is a state class
class _QuestionsScreenState extends State<QuestionsScreen> {
  //inital state class
  var currentQuestionIndex = 0;
  //a method to answer and go to the next question
  void answerQuestions(String selectedAnswer) {
    //getting the method from the widget class and use it in state class function
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex += 1;
    });
  }

  @override
  Widget build(context) {
//accessing questions dynamically
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, //vertical
          crossAxisAlignment: CrossAxisAlignment.stretch, //horizontal
          children: [
            Text(
              currentQuestion.text,
              //adding third party packages
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 201, 153, 251),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            //accessing answers dynamically
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                  answerText: answer,
                  onTap: () {
                    answerQuestions(answer);
                  });
            })
          ],
        ),
      ),
    );
  }
}
