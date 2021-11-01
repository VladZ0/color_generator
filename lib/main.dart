import 'dart:math';

import 'package:color_generator/color_generator.dart';
import 'package:color_generator/place_generator.dart';
import 'package:color_generator/random_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Test Project'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  BoxDecoration? _decoration;
  final _generator = ColorGenerator();
  final _placeGenerator = PlaceGenerator();

  double? left;
  double? top;

  @override
  void initState() {
    _decoration = BoxDecoration(color: _generator.generateColor());
    super.initState();
  }

  void _generateColor(BuildContext context) {
    _generatePositions(context);
    setState(() {
      _decoration = BoxDecoration(color: _generator.generateColor());
    });
  }

  void _generatePositions(BuildContext context) {
    left = _placeGenerator.generateLeft(MediaQuery.of(context).size.width);
    top = _placeGenerator.generateTop(MediaQuery.of(context).size.height);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _generateColor(context),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: RandomWidget(
          decoration: _decoration,
          left: left,
          top: top,
        ),
      ),
    );
  }
}
