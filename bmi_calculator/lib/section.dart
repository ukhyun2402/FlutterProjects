import 'dart:developer';

import 'package:flutter/material.dart';

const int defaultCardColor = 0xFF1D1E33;

class Section extends StatelessWidget {
  Section({
    this.colour = const Color(defaultCardColor),
    this.child = null,
  });

  final Color colour;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10),
        ),
        child: child,
      ),
    );
  }
}
