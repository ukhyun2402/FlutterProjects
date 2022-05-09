import 'package:flutter/material.dart';

const labelTextStyle = TextStyle(
  fontSize: 18,
  color: Color(0xFF8D8E98),
);

class IconWithText extends StatelessWidget {
  final String widgetString;
  final IconData widgetIcon;

  IconWithText({
    required this.widgetIcon,
    required this.widgetString,
  });

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(
        widgetIcon,
        size: 80,
      ),
      const SizedBox(
        height: 15,
      ),
      Text(widgetString, style: labelTextStyle),
    ]);
  }
}
