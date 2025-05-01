class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  /// Returns a new shuffled list of the answer options
  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers); // creates a copy
    shuffledList.shuffle();
    return shuffledList;
  }
}
