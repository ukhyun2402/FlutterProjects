import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPress() {

          },
          child:Text('Get Location'),
        ),
      ),
    );
  }
}
