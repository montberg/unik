class SelectedAnswer{
  int questionIndex;
  int answer;
  SelectedAnswer(this.questionIndex, this.answer);

  @override
  String toString() {
    // TODO: implement toString
    return "$questionIndex - $answer";
  }
}