import 'dart:developer';

import 'package:bmi_calculator/icon_with_text.dart';
import 'package:bmi_calculator/section.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const double bottomContainerHeight = 80.0;
const Color bottomContainerColor = Color(0xFFEB1555);
const Color inactiveCardColour = Color(0xFF111328);
const Color activeCardColour = Color(0xFF1D1E33);\

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColour = inactiveCardColour;
  Color femaleCardColour = activeCardColour;

  void updateColour(Gender gender) {
    if (gender == Gender.male) {
      if (maleCardColour == inactiveCardColour) {
        maleCardColour = activeCardColour;
        femaleCardColour = inactiveCardColour;
      } else {
        maleCardColour = inactiveCardColour;
      }
    }
    if (gender == Gender.female) {
      if (femaleCardColour == inactiveCardColour) {
        femaleCardColour = activeCardColour;
        maleCardColour = inactiveCardColour;
      } else {
        femaleCardColour = inactiveCardColour;
      }
    }
  }

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
                  colour: maleCardColour,
                  child: GestureDetector(
                    onTap: () {
                      log('male');
                      setState(() {
                        updateColour(Gender.male);
                      });
                    },
                    child: IconWithText(
                      widgetIcon: FontAwesomeIcons.mars,
                      widgetString: "MALE",
                    ),
                  ),
                ),
                Section(
                  colour: femaleCardColour,
                  child: GestureDetector(
                    onTap: () {
                      log('female');
                      setState(() {
                        updateColour(Gender.female);
                      });
                    },
                    child: IconWithText(
                      widgetIcon: FontAwesomeIcons.venus,
                      widgetString: "FEMALE",
                    ),
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
