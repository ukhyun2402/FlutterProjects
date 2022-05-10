import 'dart:developer';
import 'dart:ffi';

import 'package:bmi_calculator/constant.dart';
import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  Section({
    this.colour = const Color(defaultCardColor),
    this.child = null,
    this.onTapFunction,
  });

  final Function? onTapFunction;
  final Color colour;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (onTapFunction != null) {
            onTapFunction!();
          }
        },
        child: Container(
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: colour,
            borderRadius: BorderRadius.circular(10),
          ),
          child: child,
        ),
      ),
    );
  }
}
