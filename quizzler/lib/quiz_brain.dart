import 'package:flutter/cupertino.dart';
import 'package:quizzler/question.dart';

class QuizBrain {
  List<Widget> scoreKeeper = [];
  List<Question> _questions = [
    Question(
      q: 'You can lead a cow down stairs but not up stairs.',
      a: false,
    ),
    Question(
      q: 'Approximately one quarter of human bones are in the feet',
      a: true,
    ),
    Question(
      q: 'A slug\'s blood is greer',
      a: true,
    ),
  ];

  String getQuestionText(int questionNumber) =>
      _questions[questionNumber].question;

  bool getQuestionAnswer(int questionNumber) =>
      _questions[questionNumber].answer;

  int get getQuestionLength => _questions.length;
}
