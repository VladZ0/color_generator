import 'dart:math';

import 'package:color_generator/color_generator.dart';
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

  @override
  void initState() {
    _decoration = BoxDecoration(color: _generator.generateColor());
    super.initState();
  }

  void _generateColor() {
    setState(() {
      _decoration = BoxDecoration(color: _generator.generateColor());
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _generateColor,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: _decoration,
            child: const Center(
                child: Text("Hey there",
                    style: TextStyle(fontSize: 25, color: Colors.black)))),
      ),
    );
  }
}
