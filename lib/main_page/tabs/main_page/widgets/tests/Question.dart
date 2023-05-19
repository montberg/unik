class Question{
  String text;
  List<String> answers;
  List<int> indexes;
  int? selectedAnswer;
  Question(this.text, this.answers, this.indexes, {this.selectedAnswer});

  void setAnswer(int index){
    selectedAnswer = index;
  }
}