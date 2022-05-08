class Question {
  late String _questionText;
  late bool _questionAnswer;

  Question({required String q, required bool a}) {
    _questionText = q;
    _questionAnswer = a;
  }

  String get question => _questionText;
  bool get answer => _questionAnswer;
}
