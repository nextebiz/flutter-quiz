class QuizQuestion {
  const QuizQuestion({required this.questionText, required this.answers});

  final String? questionText;
  final List<String> answers;

  shuffleAnswers() {
    List<String> shuffledAnswers = List.of(answers);
    shuffledAnswers.shuffle();
    return shuffledAnswers;
  }
}
