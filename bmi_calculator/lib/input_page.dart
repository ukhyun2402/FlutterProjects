import 'dart:developer';

import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/constant.dart';
import 'package:bmi_calculator/icon_with_text.dart';
import 'package:bmi_calculator/result_page.dart';
import 'package:bmi_calculator/section.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGedner;
  int height = 180;
  int weight = 60;
  int age = 19;

  void userSelect(Gender gender) {
    selectedGedner = gender;
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Section(
                  colour: selectedGedner == Gender.male
                      ? activeCardColour
                      : inactiveCardColour,
                  onTapFunction: () => {
                    setState(() => {userSelect(Gender.male)}),
                  },
                  child: IconWithText(
                    widgetIcon: FontAwesomeIcons.mars,
                    widgetString: "MALE",
                  ),
                ),
                Section(
                  colour: selectedGedner == Gender.female
                      ? activeCardColour
                      : inactiveCardColour,
                  onTapFunction: () => {
                    setState(() => {userSelect(Gender.female)}),
                  },
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
              Section(
                colour: activeCardColour,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "HEIGHT",
                      style: labelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: indicatorTextStyle,
                        ),
                        Text(
                          "cm",
                          style: labelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: const SliderThemeData(
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8D8E98),
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 15.0,
                        ),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        divisions: 100,
                        onChanged: (value) {
                          setState(() {
                            height = value.toInt();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
          Expanded(
            child: Row(children: [
              Section(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Weight",
                      style: labelTextStyle,
                    ),
                    Text(
                      weight.toString(),
                      style: indicatorTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                          iconData: FontAwesomeIcons.minus,
                          onCallback: () {
                            setState(() {
                              weight--;
                            });
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        RoundIconButton(
                          iconData: FontAwesomeIcons.plus,
                          onCallback: () {
                            setState(() {
                              weight++;
                            });
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Section(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Age",
                      style: labelTextStyle,
                    ),
                    Text(
                      age.toString(),
                      style: indicatorTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                          iconData: FontAwesomeIcons.minus,
                          onCallback: () {
                            setState(() {
                              age--;
                            });
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        RoundIconButton(
                          iconData: FontAwesomeIcons.plus,
                          onCallback: () {
                            setState(() {
                              age++;
                            });
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ]),
          ),
          Container(
            color: kBottomContainerColor,
            margin: EdgeInsets.only(top: 10, left: 10, right: 10),
            height: bottomContainerHeight,
            child: BottomButton(
              text: "CALCUATE",
              onPressed: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: height, weight: weight);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (builder) => ResultPage(
                      bmiResult: calc.calculateBMI(),
                      interpretation: calc.getInterpretation(),
                      resultText: calc.getResult(),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  const BottomButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Center(
        child: Text(
          text,
          style: LargeButtonTextStyle,
        ),
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData iconData;
  late Function _onCallback;

  RoundIconButton({
    required this.iconData,
    Function? onCallback,
  }) {
    if (onCallback == null) {
      _onCallback = () {};
    } else {
      _onCallback = onCallback;
    }
  }

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        _onCallback();
      },
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      elevation: 20,
      constraints: BoxConstraints.tightFor(
        height: 56,
        width: 56,
      ),
      child: Icon(iconData),
    );
  }
}
