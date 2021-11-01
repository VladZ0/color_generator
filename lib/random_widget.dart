import 'package:color_generator/place_generator.dart';
import 'package:flutter/material.dart';

class RandomWidget extends StatelessWidget {
  RandomWidget({Key? key, this.decoration, this.left, this.top})
      : super(key: key);
  final BoxDecoration? decoration;
  final double? left;
  final double? top;
  final _textStyle = const TextStyle(fontSize: 25, color: Colors.black);
  static const offset = 110;
  double leftOffset = 0;
  double topOffset = 0;

  @override
  Widget build(BuildContext context) {
    final _tSize = _textSize("Hey there", _textStyle);
    leftOffset = _tSize.width;
    topOffset = _tSize.height;

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: decoration,
      child: left != null && top != null
          ? Stack(fit: StackFit.expand, children: [
              Positioned(
                  width: leftOffset,
                  height: topOffset,
                  left: left! < leftOffset
                      ? left
                      : left! + leftOffset > MediaQuery.of(context).size.width
                          ? left! - leftOffset
                          : left,
                  top: top! < topOffset
                      ? top
                      : top! + topOffset >
                              MediaQuery.of(context).size.height - 75
                          ? top! - topOffset
                          : top,
                  child: const Text("Hey there",
                      style: TextStyle(fontSize: 25, color: Colors.black))),
            ])
          : const Center(
              child: Text("Hey there",
                  style: TextStyle(fontSize: 25, color: Colors.black))),
    );
  }

  Size _textSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: 1,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }
}
