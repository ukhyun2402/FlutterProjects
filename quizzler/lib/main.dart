import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quizzler/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(Quizzler());
}

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int quizIndex = 0;

  void resetQuiz() {
    setState(() {
      quizIndex = 0;
      quizBrain.scoreKeeper.clear();
    });
  }

  void nextQuizIndex(bool answer) {
    setState(() {
      if (answer == quizBrain.getQuestionAnswer(quizIndex)) {
        quizBrain.scoreKeeper.add(
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
      } else {
        quizBrain.scoreKeeper.add(
          Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
      }
      log("$quizIndex, ${quizBrain.getQuestionLength}");
      if (quizIndex == quizBrain.getQuestionLength - 1) {
        Alert(
            context: context,
            type: AlertType.success,
            title: "Done!",
            desc: "Problems are exhausing",
            buttons: [
              DialogButton(
                  child: Text(
                    "RESET",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    resetQuiz();
                    Navigator.pop(context);
                  })
            ]).show();
      } else {
        quizIndex = ++quizIndex % quizBrain.getQuestionLength;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(quizIndex),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                textStyle: TextStyle(color: Colors.white),
              ),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                nextQuizIndex(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                textStyle: TextStyle(color: Colors.white),
              ),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {
                  nextQuizIndex(false);
                });
              },
            ),
          ),
        ),
        Row(
          children: quizBrain.scoreKeeper,
        )
      ],
    );
  }
}
