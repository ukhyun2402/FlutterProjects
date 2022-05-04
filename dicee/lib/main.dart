import 'dart:developer';
import 'dart:math' as math;
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Dicee",
          ),
          backgroundColor: Colors.red,
        ),
        backgroundColor: Colors.red,
        body: DicePage(),
      ),
    );
  }
}

// class DicePage extends StatelessWidget {
//   DicePage({Key? key}) : super(key: key);
// }

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 5;
  int rightDiceNumber = 1;

  int getRandomNum() {
    return math.Random().nextInt(6) + 1;
  }

  void changeDiceNums() {
    leftDiceNumber = getRandomNum();
    rightDiceNumber = getRandomNum();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: TextButton(
              child: Image.asset('images/dice$leftDiceNumber.png'),
              onPressed: () => {
                setState(() {
                  changeDiceNums();
                }),
                log('clicked, first dice image $leftDiceNumber'),
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: TextButton(
              onPressed: () => {
                setState(() {
                  changeDiceNums();
                }),
                log('clicked, second dice image'),
              },
              child: Image.asset('images/dice$rightDiceNumber.png'),
            ),
          ),
        ],
      ),
    );
  }
}
