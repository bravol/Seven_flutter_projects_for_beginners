import 'package:flutter/material.dart';
import 'package:second_flutter_app/data/questions.dart';
import 'package:second_flutter_app/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  //constructor function
  const ResultScreen({super.key, required this.choseAnswers});
// to pass data into a widget you mush pass an argument here in a constructor
  final List<String>
      choseAnswers; // adding another property to pass data inot a widget such as chosen answers

// a function to display chosen answers
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choseAnswers.length; i++) {
      //loop body
      summary.add({
        'questions_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': choseAnswers[i],
      });
    }
    return summary;
  }

//build method
  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();

    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length; //where filters the original list and create a new list

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                "You answered $numCorrectQuestions out of $numTotalQuestions questions correctly"),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton(onPressed: () {}, child: const Text("Restart Quiz")),
          ],
        ),
      ),
    );
  }
}
