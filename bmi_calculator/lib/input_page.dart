import 'dart:developer';

import 'package:bmi_calculator/icon_with_text.dart';
import 'package:bmi_calculator/section.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const double bottomContainerHeight = 80.0;
const Color bottomContainerColor = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI CALCULATOR",
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Section(
                  child: GestureDetector(
                    onTap: () {
                      log('clicked, MALE button');
                    },
                    child: IconWithText(
                      widgetIcon: FontAwesomeIcons.mars,
                      widgetString: "MALE",
                    ),
                  ),
                ),
                Section(
                  child: IconWithText(
                    widgetIcon: FontAwesomeIcons.venus,
                    widgetString: "FEMALE",
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(children: [
              Section(),
            ]),
          ),
          Expanded(
            child: Row(children: [
              Section(),
              Section(),
            ]),
          ),
          Container(
            color: bottomContainerColor,
            margin: EdgeInsets.only(top: 10),
            height: bottomContainerHeight,
          )
        ],
      ),
    );
  }
}
