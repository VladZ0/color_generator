import 'dart:math';

import 'package:flutter/material.dart';

class ColorGenerator {
  final Random _random = Random();
  static const maxColors = 16777216;
  static const maxInt = ((1 << 31) - 1);

  Color generateColor() {
    return Color(maxInt - maxColors + _random.nextInt(maxColors));
  }
}
