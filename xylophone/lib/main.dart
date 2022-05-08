import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(const XylophoneApp());

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  Widget buildKey({
    Color? color,
    int musicNumber = 1,
  }) {
    return Expanded(
      flex: 1,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: color),
        onPressed: () {
          playSound('note$musicNumber');
        },
        child: Container(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(color: Colors.red, musicNumber: 1),
              buildKey(color: Colors.orange, musicNumber: 2),
              buildKey(color: Colors.yellow, musicNumber: 3),
              buildKey(color: Colors.green, musicNumber: 4),
              buildKey(color: Colors.green.shade800, musicNumber: 5),
              buildKey(color: Colors.blue, musicNumber: 6),
              buildKey(color: Colors.purple, musicNumber: 7),
            ],
          ),
        ),
      ),
    );
  }

  void playSound(String name) {
    final player = AudioCache();
    player.play('$name.wav');
  }
}
