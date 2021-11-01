import 'package:color_generator/place_generator.dart';
import 'package:flutter/material.dart';

class RandomWidget extends StatelessWidget {
  const RandomWidget({Key? key, this.decoration, this.left, this.top})
      : super(key: key);
  final BoxDecoration? decoration;
  final double? left;
  final double? top;

  static const offset = 110;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: decoration,
      child: left != null && top != null
          ? Expanded(
              child: Stack(children: [
                Positioned(
                  left: left! < offset
                      ? left
                      : left! + offset > MediaQuery.of(context).size.width
                          ? left! - offset
                          : left!,
                  top: top! < offset
                      ? top
                      : top! + offset > MediaQuery.of(context).size.height
                          ? top! - offset
                          : top!,
                  child: SizedBox(
                      width: offset.toDouble(),
                      height: offset.toDouble(),
                      child: const Text("Hey there",
                          style: TextStyle(fontSize: 25, color: Colors.black))),
                ),
              ]),
            )
          : const Center(
              child: Text("Hey there",
                  style: TextStyle(fontSize: 25, color: Colors.black))),
    );
  }
}
