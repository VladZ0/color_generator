import 'dart:math';

class PlaceGenerator {
  final Random _random = Random();

  double generateLeft(double width) {
    return _random.nextDouble() * width;
  }

  double generateTop(double height) {
    return _random.nextDouble() * height;
  }
}
