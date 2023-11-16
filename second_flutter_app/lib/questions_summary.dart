import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // adding fixed size(refactor)
      height: 300,
      child: SingleChildScrollView(
        //scrollable widget
        child: Column(
          children: summaryData.map((data) {
            return Row(children: [
              Text(((data['questions_index'] as int) + 1).toString()),
              Expanded(
                child: Column(
                  children: [
                    Text(data['question'] as String),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      data['user_answer'] as String,
                    ),
                    Text(data['correct_answer'] as String),
                  ],
                ),
              )
            ]);
          }).toList(),
        ),
      ),
    );
  }
}
