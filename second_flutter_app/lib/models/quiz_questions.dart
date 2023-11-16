//it acts as a blue prinit for the questions.
class QuizQuestion {
  //constructor function so that we can reuse these classes
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

//a method to interchange /shuffle the answers
  List<String> getShuffledAnswers() {
    //create a copy of answers
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
